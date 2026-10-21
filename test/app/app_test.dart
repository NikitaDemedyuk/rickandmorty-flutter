import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/app.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';
import 'package:rickandmorty/features/characters/presentation/list/characters_list_page.dart';

import '../helpers/characters.dart';
import '../helpers/fake_cache_manager.dart';
import '../helpers/mock_characters_repository.dart';

void main() {
  late GetIt getIt;

  setUp(() {
    final repository = MockCharactersRepository()
      ..stubAnyPage(Ok(charactersPage([1], hasNext: false)));
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

  for (final MapEntry(key: brightness, value: theme) in {
    Brightness.light: AppTheme.light,
    Brightness.dark: AppTheme.dark,
  }.entries) {
    testWidgets('follows the system appearance (${brightness.name})', (
      tester,
    ) async {
      tester.platformDispatcher.platformBrightnessTestValue = brightness;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

      await tester.pumpWidget(App(getIt: getIt));
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(CharactersListPage));
      expect(Theme.of(context).brightness, brightness);
      expect(Theme.of(context).colorScheme, theme.colorScheme);
    });
  }

  testWidgets('switches theme when the system appearance changes', (
    tester,
  ) async {
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await tester.pumpWidget(App(getIt: getIt));
    await tester.pumpAndSettle();

    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    // Lets the theme animation, which lerps StatusColors too, finish.
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(CharactersListPage));
    expect(Theme.of(context).colorScheme, AppTheme.dark.colorScheme);
    expect(StatusColors.of(context), AppTheme.dark.extension<StatusColors>());
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
