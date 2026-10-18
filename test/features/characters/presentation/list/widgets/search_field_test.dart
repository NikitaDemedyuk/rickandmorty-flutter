import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/search_field.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  late TextEditingController controller;
  late List<String> changes;

  setUp(() {
    controller = TextEditingController();
    changes = [];
  });

  tearDown(() => controller.dispose());

  Future<void> pump(WidgetTester tester) => tester.pumpApp(
    SearchField(controller: controller, onChanged: changes.add),
  );

  testWidgets('reports typed text and hides clear while empty', (tester) async {
    await pump(tester);

    expect(find.text('Search characters'), findsOneWidget);
    expect(find.byTooltip('Clear search'), findsNothing);

    await tester.enterText(find.byType(TextField), 'rick');
    await tester.pump();

    expect(changes, ['rick']);
    expect(find.byTooltip('Clear search'), findsOneWidget);
  });

  testWidgets('clear empties the field and reports an empty query', (
    tester,
  ) async {
    await pump(tester);
    await tester.enterText(find.byType(TextField), 'rick');
    await tester.pump();

    await tester.tap(find.byTooltip('Clear search'));
    await tester.pump();

    expect(controller.text, isEmpty);
    expect(changes, ['rick', '']);
    expect(find.byTooltip('Clear search'), findsNothing);
  });
}
