import 'package:dio/dio.dart';

/// A [DioException] of [type], carrying a response with [headers] when
/// [statusCode] is set.
DioException dioException(
  DioExceptionType type, {
  int? statusCode,
  Map<String, List<String>> headers = const {},
  Object? error,
}) {
  final requestOptions = RequestOptions(path: '/character');
  return DioException(
    requestOptions: requestOptions,
    type: type,
    error: error,
    response: statusCode == null
        ? null
        : Response<void>(
            requestOptions: requestOptions,
            statusCode: statusCode,
            headers: Headers.fromMap(headers),
          ),
  );
}
