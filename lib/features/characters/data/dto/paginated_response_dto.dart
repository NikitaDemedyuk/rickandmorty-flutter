import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response_dto.freezed.dart';
part 'paginated_response_dto.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedResponseDto<T> with _$PaginatedResponseDto<T> {
  const factory({required PageInfoDto info, required List<T> results}) =
      _PaginatedResponseDto<T>;

  factory fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseDtoFromJson(json, fromJsonT);
}

@freezed
abstract class PageInfoDto with _$PageInfoDto {
  /// [next] is the URL of the next page, or `null` on the last one.
  const factory({required String? next}) = _PageInfoDto;

  factory fromJson(Map<String, Object?> json) => _$PageInfoDtoFromJson(json);
}
