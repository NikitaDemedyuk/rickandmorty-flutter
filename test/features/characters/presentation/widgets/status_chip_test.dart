import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/status_chip.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  final statusColors = AppTheme.light.extension<StatusColors>()!;
  final cases = {
    CharacterStatus.alive: ('Alive', statusColors.alive),
    CharacterStatus.dead: ('Dead', statusColors.dead),
    CharacterStatus.unknown: ('Unknown', statusColors.unknown),
  };

  Color dotColor(WidgetTester tester) {
    final dot = tester.widget<DecoratedBox>(find.byKey(StatusChip.dotKey));
    return (dot.decoration as BoxDecoration).color!;
  }

  for (final MapEntry(key: status, value: (label, color)) in cases.entries) {
    testWidgets('labels $status as "$label"', (tester) async {
      await tester.pumpApp(StatusChip(status: status));

      expect(find.text(label), findsOneWidget);
    });

    testWidgets('colors the $status dot from StatusColors', (tester) async {
      await tester.pumpApp(StatusChip(status: status));

      expect(dotColor(tester), color);
    });
  }
}
