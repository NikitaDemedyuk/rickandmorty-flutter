import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:material_ui/material_ui.dart';

/// Tag shared by a character's image on the list and on the details screen.
String characterHeroTag(int id) => 'character-image-$id';

/// A character's portrait, filling its parent. The clip sits inside the
/// [Hero], so the portrait keeps its rounded shape while it flies.
///
/// Always decoded at the API's 300 px original: the list and the details
/// screen then share one in-memory image, so the Hero flies the portrait
/// (not the placeholder) on push and stays sharp on pop.
class CharacterImage extends StatelessWidget {
  const new({
    required this.characterId,
    required this.imageUrl,
    required this.cacheManager,
    required this.borderRadius,
    super.key,
  });

  final int characterId;
  final String imageUrl;
  final BaseCacheManager cacheManager;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Hero(
      tag: characterHeroTag(characterId),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          cacheManager: cacheManager,
          fit: BoxFit.cover,
          placeholder: (_, _) =>
              ColoredBox(color: colorScheme.surfaceContainerHighest),
          errorWidget: (_, _, _) => ColoredBox(
            color: colorScheme.surfaceContainerHighest,
            child: Icon(Icons.person, color: colorScheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }
}
