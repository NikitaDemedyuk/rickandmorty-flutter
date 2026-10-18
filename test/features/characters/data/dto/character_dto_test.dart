import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/features/characters/data/dto/character_dto.dart';

import '../../../../helpers/fixtures.dart';

void main() {
  group('CharacterDto.fromJson', () {
    test('parses a character, ignoring fields it does not map', () {
      expect(
        CharacterDto.fromJson(fixtureJson('character.json')),
        const CharacterDto(
          id: 1,
          name: 'Rick Sanchez',
          status: 'Alive',
          species: 'Human',
          origin: LocationRefDto(name: 'Earth (C-137)'),
          location: LocationRefDto(name: 'Citadel of Ricks'),
          image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
        ),
      );
    });

    test('throws CheckedFromJsonException on a malformed payload', () {
      expect(
        () => CharacterDto.fromJson(fixtureJson('malformed_character.json')),
        throwsA(
          isA<CheckedFromJsonException>().having((e) => e.key, 'key', 'id'),
        ),
      );
    });
  });
}
