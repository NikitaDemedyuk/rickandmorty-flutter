// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedResponseDto<T> _$PaginatedResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate('_PaginatedResponseDto', json, ($checkedConvert) {
  final val = _PaginatedResponseDto<T>(
    info: $checkedConvert(
      'info',
      (v) => PageInfoDto.fromJson(v as Map<String, dynamic>),
    ),
    results: $checkedConvert(
      'results',
      (v) => (v as List<dynamic>).map(fromJsonT).toList(),
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
