import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';

import '../../../../helpers/characters.dart';
import '../../../../helpers/fake_cache_manager.dart';
import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('loads the image through the cache manager inside a Hero', (
    tester,
  ) async {
    final cacheManager = FakeCacheManager();
    await tester.pumpApp(
      CharacterImage(
        character: character(7),
        cacheManager: cacheManager,
        memCacheWidth: 100,
      ),
    );

    final hero = tester.widget<Hero>(find.byType(Hero));
    expect(hero.tag, characterHeroTag(7));
    final image = tester.widget<CachedNetworkImage>(
      find.descendant(
        of: find.byType(Hero),
        matching: find.byType(CachedNetworkImage),
      ),
    );
    expect(image.imageUrl, character(7).imageUrl);
    expect(image.cacheManager, same(cacheManager));
    expect(image.memCacheWidth, 100);
  });
}
