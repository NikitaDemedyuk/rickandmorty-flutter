import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/features/characters/data/dto/character_dto.dart';
import 'package:rickandmorty/features/characters/data/dto/paginated_response_dto.dart';

import '../../../../helpers/fixtures.dart';

void main() {
  PaginatedResponseDto<CharacterDto> parse(String name) =>
      PaginatedResponseDto.fromJson(
        fixtureJson(name),
        (json) => CharacterDto.fromJson(json! as Map<String, Object?>),
      );

  group('PaginatedResponseDto.fromJson', () {
    test('parses the page info and the results', () {
      final dto = parse('characters_page.json');

      expect(
        dto.info,
        const PageInfoDto(
          next: 'https://rickandmortyapi.com/api/character?page=2',
        ),
      );
      expect(dto.results.map((c) => c.id), [1, 8, 19]);
    });

    test('parses a null next link on the last page', () {
      final dto = parse('characters_last_page.json');

      expect(dto.info.next, isNull);
      expect(dto.results.map((c) => c.id), [825, 826]);
    });
  });
}
