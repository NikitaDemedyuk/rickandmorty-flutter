import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/app/app.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';
import 'package:rickandmorty/features/characters/presentation/list/characters_list_page.dart';

import '../helpers/characters.dart';
import '../helpers/fake_cache_manager.dart';

class _MockRepository extends Mock implements CharactersRepository;

void main() {
  late GetIt getIt;

  setUp(() {
    final repository = _MockRepository();
    when(
      () => repository.getCharacters(
        page: any(named: 'page'),
        name: any(named: 'name'),
        cancelSignal: any(named: 'cancelSignal'),
      ),
    ).thenAnswer((_) async => Ok(charactersPage([1], hasNext: false)));
    getIt = GetIt.asNewInstance()
      ..registerSingleton<CharactersRepository>(repository)
      ..registerSingleton<BaseCacheManager>(FakeCacheManager());
  });

  testWidgets('renders the characters list with the English title', (
    tester,
  ) async {
    await tester.pumpWidget(App(getIt: getIt));
    await tester.pumpAndSettle();

    expect(find.byType(CharactersListPage), findsOneWidget);
    expect(find.text('Rick and Morty'), findsOneWidget);
    expect(find.text('Character 1'), findsOneWidget);
  });

  testWidgets('stays in English on a non-English device', (tester) async {
    tester.platformDispatcher.localesTestValue = const [Locale('ru')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    await tester.pumpWidget(App(getIt: getIt));
    await tester.pumpAndSettle();

    expect(find.text('Rick and Morty'), findsOneWidget);
  });

  testWidgets('shows an error page for unknown routes and goes home', (
    tester,
  ) async {
    await tester.pumpWidget(App(getIt: getIt, initialLocation: '/nowhere'));
    await tester.pumpAndSettle();

    expect(find.byType(ErrorView), findsOneWidget);
    expect(find.text('Page not found'), findsOneWidget);

    expect(find.text('Retry'), findsNothing);

    await tester.tap(find.text('Go home'));
    await tester.pumpAndSettle();

    expect(find.byType(CharactersListPage), findsOneWidget);
  });
}
