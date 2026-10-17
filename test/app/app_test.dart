import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/app.dart';
import 'package:rickandmorty/app/home_placeholder_page.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';

void main() {
  testWidgets('renders the home page with the English title', (tester) async {
    await tester.pumpWidget(const App(locale: Locale('en')));
    await tester.pumpAndSettle();

    expect(find.byType(HomePlaceholderPage), findsOneWidget);
    expect(find.text('Rick and Morty'), findsOneWidget);
  });

  testWidgets('uses the Russian title for the ru locale', (tester) async {
    await tester.pumpWidget(const App(locale: Locale('ru')));
    await tester.pumpAndSettle();

    expect(find.text('Рик и Морти'), findsOneWidget);
  });

  testWidgets('shows an error page for unknown routes and goes home on retry', (
    tester,
  ) async {
    await tester.pumpWidget(
      const App(locale: Locale('en'), initialLocation: '/nowhere'),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ErrorView), findsOneWidget);
    expect(find.text('Page not found'), findsOneWidget);

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.byType(HomePlaceholderPage), findsOneWidget);
  });
}
