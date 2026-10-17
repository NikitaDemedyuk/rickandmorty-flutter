import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('shows the message and calls onRetry on tap', (tester) async {
    var retries = 0;
    await tester.pumpApp(ErrorView(message: 'Oops', onRetry: () => retries++));

    expect(find.text('Oops'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    expect(retries, 1);
  });

  testWidgets('hides the retry button without onRetry', (tester) async {
    await tester.pumpApp(const ErrorView(message: 'Oops'));

    expect(find.text('Retry'), findsNothing);
  });
}
