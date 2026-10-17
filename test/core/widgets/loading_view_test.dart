import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('shows a progress indicator', (tester) async {
    await tester.pumpApp(const LoadingView());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
