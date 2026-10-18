import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/status_chip.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  const labels = {
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
}
