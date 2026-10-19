import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/status_chip.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  Color dotColor(WidgetTester tester) {
    final dot = tester.widget<DecoratedBox>(find.byKey(StatusChip.dotKey));
    return (dot.decoration as BoxDecoration).color!;
  }

  final labels = {
    CharacterStatus.alive: 'Alive',
    CharacterStatus.dead: 'Dead',
    CharacterStatus.unknown: 'Unknown',
  };

  for (final MapEntry(key: status, value: label) in labels.entries) {
    testWidgets('labels $status as "$label"', (tester) async {
      await tester.pumpApp(StatusChip(status: status));

      expect(find.text(label), findsOneWidget);
    });
  }

  for (final MapEntry(key: themeName, value: theme) in {
    'light': AppTheme.light,
    'dark': AppTheme.dark,
  }.entries) {
    final statusColors = theme.extension<StatusColors>()!;
    final colors = {
      CharacterStatus.alive: statusColors.alive,
      CharacterStatus.dead: statusColors.dead,
      CharacterStatus.unknown: statusColors.unknown,
    };

    for (final MapEntry(key: status, value: color) in colors.entries) {
      testWidgets('colors the $status dot from StatusColors ($themeName)', (
        tester,
      ) async {
        await tester.pumpApp(StatusChip(status: status), theme: theme);

        expect(dotColor(tester), color);
      });
    }
  }
}
