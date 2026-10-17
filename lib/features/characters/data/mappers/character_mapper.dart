import 'package:rickandmorty/features/characters/data/dto/character_dto.dart';
import 'package:rickandmorty/features/characters/data/dto/paginated_response_dto.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/features/characters/domain/entities/characters_page.dart';

extension CharacterDtoMapper on CharacterDto {
  Character toEntity() => Character(
    id: id,
    name: name,
    imageUrl: image,
    status: _status(status),
    species: species,
    originName: _knownOrNull(origin.name),
    locationName: _knownOrNull(location.name),
  );
}

extension CharactersPageDtoMapper on PaginatedResponseDto<CharacterDto> {
  CharactersPage toEntity() => CharactersPage(
    characters: [for (final dto in results) dto.toEntity()],
    hasNext: info.next != null,
  );
}

CharacterStatus _status(String status) => switch (status) {
  'Alive' => CharacterStatus.alive,
  'Dead' => CharacterStatus.dead,
  _ => CharacterStatus.unknown,
};

/// The API reports a missing origin or location as the string `"unknown"`.
String? _knownOrNull(String name) =>
    name.isEmpty || name == 'unknown' ? null : name;
