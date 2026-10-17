import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/error/failure_message.dart';

import '../../helpers/pump_app.dart';

void main() {
  final cases = <(Failure, String)>[
    (
      const NetworkFailure(),
      'No internet connection. Check your network and try again.',
    ),
    (
      const ServerFailure(503),
      'The server is not responding properly. Please try again later.',
    ),
    (const NotFoundFailure(), 'Nothing was found.'),
    (const UnknownFailure(), 'Something went wrong. Please try again.'),
  ];

  for (final (failure, message) in cases) {
    testWidgets('maps $failure to its localized message', (tester) async {
      await tester.pumpApp(
        Builder(builder: (context) => Text(failureMessage(context, failure))),
      );

      expect(find.text(message), findsOneWidget);
    });
  }

  testWidgets('uses the Russian translation for the ru locale', (tester) async {
    await tester.pumpApp(
      Builder(
        builder: (context) =>
            Text(failureMessage(context, const NotFoundFailure())),
      ),
      locale: const Locale('ru'),
    );

    expect(find.text('Ничего не найдено.'), findsOneWidget);
  });
}
