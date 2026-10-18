// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharactersResponseDto _$CharactersResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CharactersResponseDto', json, ($checkedConvert) {
  final val = _CharactersResponseDto(
    info: $checkedConvert(
      'info',
      (v) => PageInfoDto.fromJson(v as Map<String, dynamic>),
    ),
    results: $checkedConvert(
      'results',
      (v) => (v as List<dynamic>)
          .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

_PageInfoDto _$PageInfoDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PageInfoDto', json, ($checkedConvert) {
      final val = _PageInfoDto(
        next: $checkedConvert('next', (v) => v as String?),
      );
      return val;
    });
