import 'dart:async';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/app/app.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';
import 'package:rickandmorty/features/characters/presentation/details/character_details_page.dart';
import 'package:rickandmorty/features/characters/presentation/list/bloc/characters_bloc.dart';
import 'package:rickandmorty/features/characters/presentation/list/characters_list_page.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';

import '../helpers/characters.dart';
import '../helpers/fake_cache_manager.dart';
import '../helpers/mock_characters_repository.dart';

void main() {
  late MockCharactersRepository repository;
  late GetIt getIt;

  setUp(() {
    repository = MockCharactersRepository()
      ..stubAnyPage(
        Ok(
          charactersPage([for (var id = 1; id <= 20; id++) id], hasNext: false),
        ),
      );
    getIt = GetIt.asNewInstance()
      ..registerSingleton<CharactersRepository>(repository)
      ..registerSingleton<BaseCacheManager>(FakeCacheManager());
  });

  Future<void> pumpAt(WidgetTester tester, String location) async {
    await tester.pumpWidget(App(getIt: getIt, initialLocation: location));
    await tester.pumpAndSettle();
  }

  /// Runs the page transition to its end. A loader never settles, so
  /// `pumpAndSettle` would time out while a fetch is pending.
  Future<void> pumpPastTransition(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
  }

  ScrollPosition listPosition(WidgetTester tester) => tester
      .state<ScrollableState>(
        find
            .descendant(
              of: find.byType(PagedListView<int, Character>),
              matching: find.byType(Scrollable),
            )
            .first,
      )
      .position;

  testWidgets('back from details keeps the query, items and scroll position '
      'without refetching the list', (tester) async {
    repository.stubCharacter(8, Ok(character(8)));
    await pumpAt(tester, AppRoutes.home);

    await tester.enterText(find.byType(TextField), 'rick');
    await tester.pump(CharactersBloc.searchDebounce);
    await tester.pumpAndSettle();
    await tester.drag(
      find.byType(PagedListView<int, Character>),
      const Offset(0, -300),
    );
    await tester.pumpAndSettle();
    final offset = listPosition(tester).pixels;
    expect(offset, greaterThan(0));

    await tester.tap(find.text('Character 8'));
    await tester.pumpAndSettle();

    expect(find.byType(CharacterDetailsPage), findsOneWidget);
    expect(find.text('Character 8'), findsNWidgets(2));
    verify(() => repository.getCharacter(8)).called(1);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.byType(CharacterDetailsPage), findsNothing);
    expect(find.widgetWithText(TextField, 'rick'), findsOneWidget);
    expect(find.text('Character 8'), findsOneWidget);
    expect(listPosition(tester).pixels, offset);
    for (final name in ['', 'rick']) {
      verify(
        () => repository.getCharacters(
          page: 1,
          name: name,
          cancelSignal: any(named: 'cancelSignal'),
        ),
      ).called(1);
    }
    verifyNoMoreInteractions(repository);
  });

  testWidgets('a tap hands the portrait over, so it shows while loading', (
    tester,
  ) async {
    final response = Completer<Result<Character>>();
    when(() => repository.getCharacter(1)).thenAnswer((_) => response.future);
    await pumpAt(tester, AppRoutes.home);

    await tester.tap(find.text('Character 1'));
    await pumpPastTransition(tester);

    final details = find.byType(CharacterDetailsPage);
    final portrait = find.descendant(
      of: details,
      matching: find.byType(CharacterImage),
    );
    expect(
      tester.widget<CharacterImage>(portrait).imageUrl,
      character(1).imageUrl,
    );
    expect(
      find.descendant(of: details, matching: find.byType(LoadingView)),
      findsOneWidget,
    );

    response.complete(Ok(character(1)));
    await tester.pumpAndSettle();

    expect(find.text('Character 1'), findsNWidgets(2));
    expect(portrait, findsOneWidget);
  });

  testWidgets('a deep link fetches the character and goes back to the list', (
    tester,
  ) async {
    final response = Completer<Result<Character>>();
    when(() => repository.getCharacter(1)).thenAnswer((_) => response.future);
    await tester.pumpWidget(
      App(getIt: getIt, initialLocation: AppRoutes.character(1)),
    );
    await pumpPastTransition(tester);

    // No portrait was handed over, so there's nothing to show yet.
    final details = find.byType(CharacterDetailsPage);
    expect(
      find.descendant(of: details, matching: find.byType(CharacterImage)),
      findsNothing,
    );
    expect(
      find.descendant(of: details, matching: find.byType(LoadingView)),
      findsOneWidget,
    );

    response.complete(Ok(character(1)));
    await tester.pumpAndSettle();

    expect(find.byType(CharacterDetailsPage), findsOneWidget);
    expect(find.text('Character 1'), findsNWidgets(2));
    verify(() => repository.getCharacter(1)).called(1);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.byType(CharactersListPage), findsOneWidget);
  });

  testWidgets('a failed fetch shows the error and retries', (tester) async {
    repository.stubCharacter(1, const Err(NetworkFailure()));
    await pumpAt(tester, AppRoutes.character(1));

    expect(find.byType(ErrorView), findsOneWidget);

    repository.stubCharacter(1, Ok(character(1)));
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.byType(ErrorView), findsNothing);
    expect(find.text('Character 1'), findsNWidgets(2));
  });

  testWidgets('a deep link to an unknown character says it does not exist', (
    tester,
  ) async {
    repository.stubCharacter(9999, const Err(NotFoundFailure()));
    await pumpAt(tester, AppRoutes.character(9999));

    expect(find.text("This character doesn't exist."), findsOneWidget);
  });

  testWidgets('going to another character loads that character', (
    tester,
  ) async {
    repository
      ..stubCharacter(1, Ok(character(1)))
      ..stubCharacter(2, Ok(character(2)));
    await pumpAt(tester, AppRoutes.character(1));

    // Same route pattern, so go_router reuses the page.
    tester
        .element(find.byType(CharacterDetailsPage))
        .go(AppRoutes.character(2));
    await tester.pumpAndSettle();

    expect(find.text('Character 2'), findsNWidgets(2));
    verify(() => repository.getCharacter(2)).called(1);
  });

  testWidgets('a non-numeric id shows the not-found page', (tester) async {
    await pumpAt(tester, '/character/abc');

    expect(find.text('Page not found'), findsOneWidget);
    verifyNever(() => repository.getCharacter(any()));
  });
}
