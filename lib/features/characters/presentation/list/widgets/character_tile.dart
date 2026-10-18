import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/presentation/list/widgets/status_chip.dart';

class CharacterTile extends StatelessWidget {
  const new({required this.character, required this.cacheManager, super.key});

  final Character character;
  final BaseCacheManager cacheManager;

  static const double _avatarSize = 56;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: ClipOval(
        child: SizedBox.square(
          dimension: _avatarSize,
          child: CachedNetworkImage(
            imageUrl: character.imageUrl,
            cacheManager: cacheManager,
            fit: BoxFit.cover,
            // Decode at thumbnail size, not the API's 300 px original.
            memCacheWidth:
                (_avatarSize * MediaQuery.devicePixelRatioOf(context)).round(),
            placeholder: (context, url) =>
                ColoredBox(color: colorScheme.surfaceContainerHighest),
            errorWidget: (context, url, error) => ColoredBox(
              color: colorScheme.surfaceContainerHighest,
              child: Icon(Icons.person, color: colorScheme.onSurfaceVariant),
            ),
          ),
        ),
      ),
      title: Text(character.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        character.species,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: StatusChip(status: character.status),
    );
  }
}
