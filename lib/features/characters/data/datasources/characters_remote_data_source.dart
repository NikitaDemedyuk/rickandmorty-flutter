import 'package:dio/dio.dart';
import 'package:rickandmorty/features/characters/data/dto/character_dto.dart';
import 'package:rickandmorty/features/characters/data/dto/paginated_response_dto.dart';

/// Talks to the `/character` endpoints. Throws [DioException] on transport
/// and HTTP errors, and `CheckedFromJsonException` on a malformed payload;
/// mapping them to failures is the repository's job.
class CharactersRemoteDataSource {
  const new(this._dio);

  final Dio _dio;

  Future<PaginatedResponseDto<CharacterDto>> fetchCharacters({
    required int page,
    String? name,
  }) async {
    final response = await _dio.get<Map<String, Object?>>(
      '/character',
      queryParameters: {'page': page, 'name': ?name},
    );
    return PaginatedResponseDto.fromJson(
      response.data!,
      (json) => CharacterDto.fromJson(json! as Map<String, Object?>),
    );
  }

  Future<CharacterDto> fetchCharacter(int id) async {
    final response = await _dio.get<Map<String, Object?>>('/character/$id');
    return CharacterDto.fromJson(response.data!);
  }
}
