import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/features/characters/data/dto/character_dto.dart';
import 'package:rickandmorty/features/characters/data/dto/characters_response_dto.dart';
import 'package:rickandmorty/features/characters/data/mappers/character_mapper.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';

void main() {
  CharacterDto dto({
    String status = 'Alive',
    String origin = 'Earth (C-137)',
    String location = 'Citadel of Ricks',
  }) => CharacterDto(
    id: 1,
    name: 'Rick Sanchez',
    status: status,
    species: 'Human',
    origin: LocationRefDto(name: origin),
    location: LocationRefDto(name: location),
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
  );

  group('CharacterDto.toEntity', () {
    test('maps every field', () {
      expect(
        dto().toEntity(),
        const Character(
          id: 1,
          name: 'Rick Sanchez',
          imageUrl: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
          status: CharacterStatus.alive,
          species: 'Human',
          originName: 'Earth (C-137)',
          locationName: 'Citadel of Ricks',
        ),
      );
    });

    for (final (api, status) in [
      ('Alive', CharacterStatus.alive),
      ('Dead', CharacterStatus.dead),
      ('unknown', CharacterStatus.unknown),
      ('Schrödinger', CharacterStatus.unknown),
    ]) {
      test('maps status "$api" to $status', () {
        expect(dto(status: api).toEntity().status, status);
      });
    }

    for (final name in ['unknown', '']) {
      test('maps origin and location "$name" to null', () {
        final character = dto(origin: name, location: name).toEntity();

        expect(character.originName, isNull);
        expect(character.locationName, isNull);
      });
    }
  });

  group('CharactersResponseDto.toEntity', () {
    test('maps the results and has a next page when next is set', () {
      final page = CharactersResponseDto(
        info: const PageInfoDto(next: 'https://example.test/?page=2'),
        results: [dto()],
      ).toEntity();

      expect(page.characters, [dto().toEntity()]);
      expect(page.hasNext, isTrue);
    });

    test('has no next page when next is null', () {
      final page = const CharactersResponseDto(
        info: PageInfoDto(next: null),
        results: [],
      ).toEntity();

      expect(page.hasNext, isFalse);
    });
  });
}
