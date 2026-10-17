// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CharacterDto', json, ($checkedConvert) {
      final val = _CharacterDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        species: $checkedConvert('species', (v) => v as String),
        origin: $checkedConvert(
          'origin',
          (v) => LocationRefDto.fromJson(v as Map<String, dynamic>),
        ),
        location: $checkedConvert(
          'location',
          (v) => LocationRefDto.fromJson(v as Map<String, dynamic>),
        ),
        image: $checkedConvert('image', (v) => v as String),
      );
      return val;
    });

_LocationRefDto _$LocationRefDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LocationRefDto', json, ($checkedConvert) {
      final val = _LocationRefDto(
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });
