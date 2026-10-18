import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/core/network/dio_client.dart';
import 'package:rickandmorty/features/characters/data/datasources/characters_remote_data_source.dart';

import '../../../../helpers/fake_http_client_adapter.dart';
import '../../../../helpers/fixtures.dart';

void main() {
  late FakeHttpClientAdapter adapter;
  late CharactersRemoteDataSource dataSource;

  setUp(() {
    adapter = FakeHttpClientAdapter();
    dataSource = CharactersRemoteDataSource(
      createDio(enableLogging: false)..httpClientAdapter = adapter,
    );
  });

  Uri? requestedUri() => adapter.lastRequest?.uri;

  group('fetchCharacters', () {
    test('requests the page and parses the response', () async {
      adapter.respond(fixture('characters_page.json'));

      final dto = await dataSource.fetchCharacters(page: 2);

      expect(
        requestedUri(),
        Uri.parse('$rickAndMortyApiBaseUrl/character?page=2'),
      );
      expect(dto.results.map((c) => c.id), [1, 8, 19]);
      expect(dto.info.next, isNotNull);
    });

    test('adds the name filter when given', () async {
      adapter.respond(fixture('characters_page.json'));

      await dataSource.fetchCharacters(page: 1, name: 'rick sanchez');

      expect(requestedUri()?.queryParameters, {
        'page': '1',
        'name': 'rick sanchez',
      });
    });

    test('throws a bad-response DioException on 404', () async {
      adapter.respond(fixture('not_found.json'), statusCode: 404);

      expect(
        () => dataSource.fetchCharacters(page: 1, name: 'zzz'),
        throwsA(
          isA<DioException>()
              .having((e) => e.type, 'type', DioExceptionType.badResponse)
              .having((e) => e.response?.statusCode, 'statusCode', 404),
        ),
      );
    });

    test('throws CheckedFromJsonException on an empty body', () async {
      adapter.respond('');

      expect(
        () => dataSource.fetchCharacters(page: 1),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });
  });

  group('fetchCharacter', () {
    test('requests the character by id and parses it', () async {
      adapter.respond(fixture('character.json'));

      final dto = await dataSource.fetchCharacter(1);

      expect(requestedUri(), Uri.parse('$rickAndMortyApiBaseUrl/character/1'));
      expect(dto.name, 'Rick Sanchez');
    });

    test('throws CheckedFromJsonException on a malformed payload', () async {
      adapter.respond(fixture('malformed_character.json'));

      expect(
        () => dataSource.fetchCharacter(1),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });

    test('throws CheckedFromJsonException on an empty body', () async {
      adapter.respond('');

      expect(
        () => dataSource.fetchCharacter(1),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });

    test('throws a bad-response DioException on 500', () async {
      adapter.respond('{}', statusCode: 500);

      expect(
        () => dataSource.fetchCharacter(1),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'statusCode',
            500,
          ),
        ),
      );
    });
  });
}
