import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rickandmorty/core/error/failure.dart';

Failure mapDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
    case DioExceptionType.connectionError:
      return const NetworkFailure();
    case DioExceptionType.badResponse:
      return switch (exception.response?.statusCode) {
        HttpStatus.notFound => const NotFoundFailure(),
        HttpStatus.tooManyRequests => const RateLimitFailure(),
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
