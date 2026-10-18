import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rickandmorty/core/error/failure.dart';

Failure mapDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutFailure();
    // A connect timeout never reached the host: unreachable, not slow.
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.connectionError:
      return const NetworkFailure();
    case DioExceptionType.badResponse:
      return switch (exception.response?.statusCode) {
        HttpStatus.notFound => const NotFoundFailure(),
        HttpStatus.tooManyRequests => RateLimitFailure(
          _retryAfter(exception.response?.headers),
        ),
        final statusCode => ServerFailure(statusCode),
      };
    // Socket, HTTP and TLS transport errors surface as `unknown`.
    case DioExceptionType.unknown when exception.error is IOException:
      return const NetworkFailure();
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      return UnknownFailure(exception);
  }
}

/// Reads `Retry-After` in its delay-seconds form; an HTTP date gives `null`.
Duration? _retryAfter(Headers? headers) {
  final value = headers?.value(HttpHeaders.retryAfterHeader);
  final seconds = value == null ? null : int.tryParse(value);
  return seconds == null || seconds < 0 ? null : Duration(seconds: seconds);
}
