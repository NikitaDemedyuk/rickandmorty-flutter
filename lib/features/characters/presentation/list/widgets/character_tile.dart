import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_image.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/status_chip.dart';

class CharacterTile extends StatelessWidget {
  const new({
    required this.character,
    required this.cacheManager,
    required this.onTap,
    super.key,
  });

  final Character character;
  final BaseCacheManager cacheManager;
  final VoidCallback onTap;

  static const double _avatarSize = 56;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipOval(
        child: SizedBox.square(
          dimension: _avatarSize,
          child: CharacterImage(
            character: character,
            cacheManager: cacheManager,
            // Decode at thumbnail size, not the API's 300 px original.
            memCacheWidth:
                (_avatarSize * MediaQuery.devicePixelRatioOf(context)).round(),
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
