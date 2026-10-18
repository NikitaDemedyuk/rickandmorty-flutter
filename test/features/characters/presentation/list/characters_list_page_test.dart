import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/core/widgets/empty_view.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/presentation/list/bloc/characters_bloc.dart';
import 'package:rickandmorty/features/characters/presentation/list/characters_list_page.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/character_tile.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/list_footers.dart';

import '../../../../helpers/characters.dart';
import '../../../../helpers/fake_cache_manager.dart';
import '../../../../helpers/mock_characters_repository.dart';
import '../../../../helpers/pump_app.dart';

class _MockBloc extends Mock implements CharactersBloc;

void main() {
  late _MockBloc bloc;

  setUp(() {
    bloc = _MockBloc();
    when(() => bloc.stream).thenAnswer((_) => const Stream.empty());
  });

  Future<void> pumpWithState(
    WidgetTester tester,
    PagingState<int, Character> paging,
  ) async {
    when(() => bloc.state)
        .thenReturn(CharactersState(query: '', paging: paging));
    await tester.pumpApp(
      BlocProvider<CharactersBloc>.value(
        value: bloc,
        child: CharactersListPage(cacheManager: FakeCacheManager()),
      ),
    );
    // Lets the list run its post-frame fetchNextPage, if any.
    await tester.pump();
  }

  List<List<Character>> pageOf(List<int> ids) => [ids.map(character).toList()];

  group('first page', () {
    testWidgets('shows a loader and requests the first page', (tester) async {
      await pumpWithState(tester, PagingState());

      expect(find.byType(LoadingView), findsOneWidget);
      verify(() => bloc.add(const CharactersNextPageRequested())).called(1);
    });

    testWidgets('shows the error and retries', (tester) async {
      await pumpWithState(tester, PagingState(error: const NetworkFailure()));

      expect(find.byType(ErrorView), findsOneWidget);
      expect(
        find.text('No internet connection. Check your network and try again.'),
        findsOneWidget,
      );

      await tester.tap(find.text('Retry'));
      verify(() => bloc.add(const CharactersNextPageRequested())).called(1);
    });

    testWidgets('shows the empty view when nothing matches', (tester) async {
      await pumpWithState(
        tester,
        PagingState(pages: const [[]], keys: const [1], hasNextPage: false),
      );

      expect(find.byType(EmptyView), findsOneWidget);
      expect(find.text('No characters found'), findsOneWidget);
    });
  });

  group('items', () {
    testWidgets('shows a tile per character and a loading footer', (
      tester,
    ) async {
      await pumpWithState(
        tester,
        PagingState(pages: pageOf([1, 2]), keys: const [1], isLoading: true),
      );

      expect(find.byType(CharacterTile), findsNWidgets(2));
      expect(find.text('Character 2'), findsOneWidget);
      expect(find.byType(NextPageLoadingFooter), findsOneWidget);
    });

    testWidgets('shows a next-page error footer that retries', (tester) async {
      await pumpWithState(
        tester,
        PagingState(
          pages: pageOf([1, 2]),
          keys: const [1],
          error: const ServerFailure(500),
        ),
      );
      clearInteractions(bloc);

      expect(find.byType(CharacterTile), findsNWidgets(2));
      expect(find.byType(NextPageErrorFooter), findsOneWidget);
      expect(
        find.text(
          'The server is not responding properly. Please try again later.',
        ),
        findsOneWidget,
      );

      await tester.tap(find.text('Retry'));
      verify(() => bloc.add(const CharactersNextPageRequested())).called(1);
    });

    testWidgets('shows the end-of-list footer after the last page', (
      tester,
    ) async {
      await pumpWithState(
        tester,
        PagingState(pages: pageOf([1]), keys: const [1], hasNextPage: false),
      );

      expect(find.byType(EndOfListFooter), findsOneWidget);
      expect(find.text("That's everyone, Morty!"), findsOneWidget);
    });
  });

  group('search', () {
    testWidgets('sends typed queries and clears them', (tester) async {
      await pumpWithState(
        tester,
        PagingState(pages: pageOf([1]), keys: const [1], hasNextPage: false),
      );

      await tester.enterText(find.byType(TextField), 'rick');
      await tester.pump();
      verify(() => bloc.add(const CharactersQueryChanged('rick'))).called(1);

      await tester.tap(find.byTooltip('Clear search'));
      await tester.pump();
      verify(() => bloc.add(const CharactersQueryChanged(''))).called(1);
      expect(find.text('rick'), findsNothing);
    });
  });

  testWidgets('pull-to-refresh reloads the first page', (tester) async {
    final repository = MockCharactersRepository()
      ..stubAnyPage(Ok(charactersPage([1, 2], hasNext: false)));

    await tester.pumpApp(
      BlocProvider(
        create: (_) => CharactersBloc(repository),
        child: CharactersListPage(cacheManager: FakeCacheManager()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(CharacterTile), findsNWidgets(2));

    await tester.fling(
      find.byType(CharacterTile).first,
      const Offset(0, 400),
      1000,
    );
    await tester.pumpAndSettle();

    verify(
      () => repository.getCharacters(
        page: 1,
        name: '',
        cancelSignal: any(named: 'cancelSignal'),
      ),
    ).called(2);
    expect(find.byType(RefreshProgressIndicator), findsNothing);
    expect(find.byType(CharacterTile), findsNWidgets(2));
  });
}
