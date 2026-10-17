import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
abstract class CharacterDto with _$CharacterDto {
  const factory({
    required int id,
    required String name,
    required String status,
    required String species,
    required LocationRefDto origin,
    required LocationRefDto location,
    required String image,
  }) = _CharacterDto;

  factory fromJson(Map<String, Object?> json) => _$CharacterDtoFromJson(json);
}

@freezed
abstract class LocationRefDto with _$LocationRefDto {
  const factory({required String name}) = _LocationRefDto;

  factory fromJson(Map<String, Object?> json) => _$LocationRefDtoFromJson(json);
}
