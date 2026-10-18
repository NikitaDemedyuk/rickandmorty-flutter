import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/network/dio_error_mapper.dart';
import 'package:rickandmorty/core/result/result.dart';
import 'package:rickandmorty/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:rickandmorty/features/characters/data/mappers/character_mapper.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/features/characters/domain/entities/characters_page.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';

final class CharactersRepositoryImpl implements CharactersRepository {
  const new(this._remote);

  final CharactersRemoteDataSource _remote;

  @override
  Future<Result<CharactersPage>> getCharacters({
    required int page,
    String? name,
  }) async {
    final query = switch (name?.trim()) {
      null || '' => null,
      final trimmed => trimmed,
    };
    final result = await _guard(
      () async =>
          (await _remote.fetchCharacters(page: page, name: query)).toEntity(),
    );
    return switch (result) {
      // The API answers a search with no matches with a 404.
      Err(failure: NotFoundFailure()) when query != null => const Ok(
        CharactersPage.empty,
      ),
      _ => result,
    };
  }

  @override
  Future<Result<Character>> getCharacter(int id) =>
      _guard(() async => (await _remote.fetchCharacter(id)).toEntity());

  Future<Result<T>> _guard<T>(Future<T> Function() request) async {
    try {
      return Ok(await request());
    } on DioException catch (e) {
      return Err(mapDioException(e));
    } on CheckedFromJsonException catch (e) {
      return Err(UnknownFailure(e));
    }
  }
}
