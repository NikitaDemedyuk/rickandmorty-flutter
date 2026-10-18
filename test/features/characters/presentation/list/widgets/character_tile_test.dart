import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/character_tile.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/status_chip.dart';

import '../../../../../helpers/characters.dart';
import '../../../../../helpers/fake_cache_manager.dart';
import '../../../../../helpers/pump_app.dart';

void main() {
  testWidgets('shows the name, species, status and avatar', (tester) async {
    final cacheManager = FakeCacheManager();
    await tester.pumpApp(
      CharacterTile(
        character: character(1, status: CharacterStatus.dead),
        cacheManager: cacheManager,
      ),
    );

    expect(find.text('Character 1'), findsOneWidget);
    expect(find.text('Human'), findsOneWidget);
    expect(find.text('Dead'), findsOneWidget);
    expect(find.byType(StatusChip), findsOneWidget);
    final image = tester.widget<CharacterImage>(find.byType(CharacterImage));
    expect(image.character, character(1, status: CharacterStatus.dead));
    expect(image.cacheManager, same(cacheManager));
    // Decoded at thumbnail size: 56 logical px at the test's 3x ratio.
    expect(image.memCacheWidth, 168);
  });
}
