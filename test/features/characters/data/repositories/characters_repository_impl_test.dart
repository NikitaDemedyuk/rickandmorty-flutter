import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:rickandmorty/features/characters/data/dto/character_dto.dart';
import 'package:rickandmorty/features/characters/data/dto/characters_response_dto.dart';
import 'package:rickandmorty/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/entities/characters_page.dart';

import '../../../../helpers/dio_exceptions.dart';
import '../../../../helpers/fixtures.dart';

class _MockRemoteDataSource extends Mock implements CharactersRemoteDataSource;

void main() {
  late _MockRemoteDataSource remote;
  late CharactersRepositoryImpl repository;

  final pageDto = CharactersResponseDto.fromJson(
    fixtureJson('characters_page.json'),
  );
  final characterDto = CharacterDto.fromJson(fixtureJson('character.json'));

  DioException badResponse(int statusCode) =>
      dioException(DioExceptionType.badResponse, statusCode: statusCode);
  final timeout = dioException(DioExceptionType.connectionTimeout);
  final malformed = CheckedFromJsonException(
    const {},
    'id',
    'CharacterDto',
    'not an int',
  );

  setUp(() {
    remote = _MockRemoteDataSource();
    repository = CharactersRepositoryImpl(remote);
  });

  group('getCharacters', () {
    void stubFetch(Future<CharactersResponseDto> Function() f) => when(
      () => remote.fetchCharacters(
        page: any(named: 'page'),
        name: any(named: 'name'),
        cancelToken: any(named: 'cancelToken'),
      ),
    ).thenAnswer((_) => f());

    test('maps the page to entities', () async {
      stubFetch(() async => pageDto);

      final result = await repository.getCharacters(page: 1);

      expect(
        result,
        isA<Ok<CharactersPage>>()
            .having((r) => r.value.characters.map((c) => c.id), 'ids', [
              1,
              8,
              19,
            ])
            .having((r) => r.value.hasNext, 'hasNext', isTrue),
      );
    });

    test('passes the page and name through', () async {
      stubFetch(() async => pageDto);

      await repository.getCharacters(page: 3, name: 'rick');

      verify(() => remote.fetchCharacters(page: 3, name: 'rick')).called(1);
    });

    test('trims the name filter', () async {
      stubFetch(() async => pageDto);

      await repository.getCharacters(page: 1, name: '  rick ');

      verify(() => remote.fetchCharacters(page: 1, name: 'rick')).called(1);
    });

    for (final name in ['', '   ']) {
      test('drops a blank name filter "$name"', () async {
        stubFetch(() async => pageDto);

        await repository.getCharacters(page: 1, name: name);

        verify(() => remote.fetchCharacters(page: 1)).called(1);
      });
    }

    test('cancels the request when the cancel signal completes', () async {
      stubFetch(() async => pageDto);
      final cancel = Completer<void>();

      await repository.getCharacters(page: 1, cancelSignal: cancel.future);
      final token =
          verify(
                () => remote.fetchCharacters(
                  page: 1,
                  cancelToken: captureAny(named: 'cancelToken'),
                ),
              ).captured.single
              as CancelToken;
      expect(token.isCancelled, isFalse);

      cancel.complete();
      await Future<void>.delayed(Duration.zero);

      expect(token.isCancelled, isTrue);
    });

    test('maps a 404 on a search to an empty page', () async {
      stubFetch(() => Future.error(badResponse(404)));

      final result = await repository.getCharacters(page: 1, name: 'zzz');

      expect(result, const Ok(CharactersPage.empty));
    });

    test('keeps a 404 without a search as NotFoundFailure', () async {
      stubFetch(() => Future.error(badResponse(404)));

      final result = await repository.getCharacters(page: 99);

      expect(result, const Err<CharactersPage>(NotFoundFailure()));
    });

    test('keeps a 404 with a blank name as NotFoundFailure', () async {
      stubFetch(() => Future.error(badResponse(404)));

      final result = await repository.getCharacters(page: 99, name: '');

      expect(result, const Err<CharactersPage>(NotFoundFailure()));
    });

    test('keeps other errors on a search as failures', () async {
      stubFetch(() => Future.error(badResponse(500)));

      final result = await repository.getCharacters(page: 1, name: 'rick');

      expect(result, const Err<CharactersPage>(ServerFailure(500)));
    });

    test('maps a timeout to NetworkFailure', () async {
      stubFetch(() => Future.error(timeout));

      final result = await repository.getCharacters(page: 1);

      expect(result, const Err<CharactersPage>(NetworkFailure()));
    });

    test('maps a malformed payload to UnknownFailure', () async {
      stubFetch(() => Future.error(malformed));

      final result = await repository.getCharacters(page: 1);

      expect(result, const Err<CharactersPage>(UnknownFailure()));
    });
  });

  group('getCharacter', () {
    test('maps the character to an entity', () async {
      when(() => remote.fetchCharacter(1))
          .thenAnswer((_) async => characterDto);

      final result = await repository.getCharacter(1);

      expect(
        result,
        isA<Ok<Character>>()
            .having((r) => r.value.id, 'id', 1)
            .having((r) => r.value.name, 'name', 'Rick Sanchez'),
      );
    });

    test('maps a 404 to NotFoundFailure', () async {
      when(() => remote.fetchCharacter(any())).thenThrow(badResponse(404));

      final result = await repository.getCharacter(9999);

      expect(result, const Err<Character>(NotFoundFailure()));
    });

    test('maps a timeout to NetworkFailure', () async {
      when(() => remote.fetchCharacter(any())).thenThrow(timeout);

      final result = await repository.getCharacter(1);

      expect(result, const Err<Character>(NetworkFailure()));
    });
  });
}
