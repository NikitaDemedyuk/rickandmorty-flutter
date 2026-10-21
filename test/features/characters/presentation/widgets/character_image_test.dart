import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';

import '../../../../helpers/characters.dart';
import '../../../../helpers/fake_cache_manager.dart';
import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('loads the image through the cache manager, clipped inside a '
      'Hero', (tester) async {
    final cacheManager = FakeCacheManager();
    const radius = BorderRadius.all(Radius.circular(12));
    await tester.pumpApp(
      CharacterImage(
        characterId: 7,
        imageUrl: character(7).imageUrl,
        cacheManager: cacheManager,
        borderRadius: radius,
      ),
    );

    final hero = tester.widget<Hero>(find.byType(Hero));
    expect(hero.tag, characterHeroTag(7));
    // The clip is the Hero's child, so the shape flies with the image.
    final clip = hero.child as ClipRRect;
    expect(clip.borderRadius, radius);
    final image = tester.widget<CachedNetworkImage>(
      find.descendant(
        of: find.byType(Hero),
        matching: find.byType(CachedNetworkImage),
      ),
    );
    expect(image.imageUrl, character(7).imageUrl);
    expect(image.cacheManager, same(cacheManager));
    // No resize, so the list and the details screen share one decode.
    expect(image.memCacheWidth, isNull);
  });
  testWidgets('is hidden from screen readers', (tester) async {
    await tester.pumpApp(
      CharacterImage(
        characterId: 7,
        imageUrl: character(7).imageUrl,
        cacheManager: FakeCacheManager(),
        borderRadius: BorderRadius.zero,
      ),
    );

    // The fake never delivers the image, so check the wrapper, not the node.
    final exclude = tester.widget<ExcludeSemantics>(
      find
          .ancestor(
            of: find.byType(CachedNetworkImage),
            matching: find.byType(ExcludeSemantics),
          )
          .first,
    );
    expect(exclude.excluding, isTrue);
  });
}
