import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/features/characters/domain/entities/characters_page.dart';

/// A character whose fields derive from [id], so equal ids are equal.
Character character(int id, {CharacterStatus status = CharacterStatus.alive}) =>
    Character(
      id: id,
      name: 'Character $id',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/$id.jpeg',
      status: status,
      species: 'Human',
      originName: null,
      locationName: null,
    );

/// A page holding a [character] per id.
CharactersPage charactersPage(List<int> ids, {bool hasNext = true}) =>
    CharactersPage(characters: ids.map(character).toList(), hasNext: hasNext);
