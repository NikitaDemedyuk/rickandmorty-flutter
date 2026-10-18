import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/features/characters/data/dto/characters_response_dto.dart';

import '../../../../helpers/fixtures.dart';

void main() {
  group('CharactersResponseDto.fromJson', () {
    test('parses the page info and the results', () {
      final dto = CharactersResponseDto.fromJson(
        fixtureJson('characters_page.json'),
      );

      expect(
        dto.info,
        const PageInfoDto(
          next: 'https://rickandmortyapi.com/api/character?page=2',
        ),
      );
      expect(dto.results.map((c) => c.id), [1, 8, 19]);
    });

    test('parses a null next link on the last page', () {
      final dto = CharactersResponseDto.fromJson(
        fixtureJson('characters_last_page.json'),
      );

      expect(dto.info.next, isNull);
      expect(dto.results.map((c) => c.id), [825, 826]);
    });
  });
}
