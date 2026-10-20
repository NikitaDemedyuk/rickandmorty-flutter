import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
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
        onTap: () {},
      ),
    );

    expect(find.text('Character 1'), findsOneWidget);
    expect(find.text('Human'), findsOneWidget);
    expect(find.text('Dead'), findsOneWidget);
    expect(find.byType(StatusChip), findsOneWidget);
    final image = tester.widget<CharacterImage>(find.byType(CharacterImage));
    expect(image.characterId, 1);
    expect(image.imageUrl, character(1).imageUrl);
    expect(image.cacheManager, same(cacheManager));
    // A circle: half the avatar's size.
    expect(image.borderRadius, const BorderRadius.all(Radius.circular(28)));
  });

  testWidgets('calls onTap when tapped', (tester) async {
    var taps = 0;
    await tester.pumpApp(
      CharacterTile(
        character: character(1),
        cacheManager: FakeCacheManager(),
        onTap: () => taps++,
      ),
    );

    await tester.tap(find.byType(CharacterTile));

    expect(taps, 1);
  });

  testWidgets('fits a long name at 2x text scale', (tester) async {
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpApp(
      CharacterTile(
        character: character(1).copyWith(
          name: 'Abradolf Lincler, Supreme Leader of the Galactic Federation',
        ),
        cacheManager: FakeCacheManager(),
        onTap: () {},
      ),
    );

    expect(tester.takeException(), isNull);
  });
}
