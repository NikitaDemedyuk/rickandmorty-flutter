import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/features/characters/data/dto/character_dto.dart';

part 'characters_response_dto.freezed.dart';
part 'characters_response_dto.g.dart';

/// One page of `GET /character`.
@freezed
abstract class CharactersResponseDto with _$CharactersResponseDto {
  const factory({
    required PageInfoDto info,
    required List<CharacterDto> results,
  }) = _CharactersResponseDto;

  factory fromJson(Map<String, Object?> json) =>
      _$CharactersResponseDtoFromJson(json);
}

@freezed
abstract class PageInfoDto with _$PageInfoDto {
  /// [next] is the URL of the next page, or `null` on the last one.
  const factory({required String? next}) = _PageInfoDto;

  factory fromJson(Map<String, Object?> json) => _$PageInfoDtoFromJson(json);
}
