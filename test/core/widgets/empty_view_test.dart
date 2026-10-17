import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/widgets/empty_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('shows the message', (tester) async {
    await tester.pumpApp(const EmptyView(message: 'Nothing here'));

    expect(find.text('Nothing here'), findsOneWidget);
  });
}
