import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';

/// Tag shared by a character's image on the list and on the details screen.
String characterHeroTag(int id) => 'character-image-$id';

/// A character's portrait, filling its parent. Callers size and clip it, so
/// each [Hero] flies with its own shape.
class CharacterImage extends StatelessWidget {
  const new({
    required this.character,
    required this.cacheManager,
    this.memCacheWidth,
    super.key,
  });

  final Character character;
  final BaseCacheManager cacheManager;

  /// Decode width in physical pixels; `null` decodes the original.
  final int? memCacheWidth;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Hero(
      tag: characterHeroTag(character.id),
      child: CachedNetworkImage(
        imageUrl: character.imageUrl,
        cacheManager: cacheManager,
        fit: BoxFit.cover,
        memCacheWidth: memCacheWidth,
        placeholder: (_, _) =>
            ColoredBox(color: colorScheme.surfaceContainerHighest),
        errorWidget: (_, _, _) => ColoredBox(
          color: colorScheme.surfaceContainerHighest,
          child: Icon(Icons.person, color: colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}
