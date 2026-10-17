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
      final statusCode = exception.response?.statusCode;
      return statusCode == HttpStatus.notFound
          ? const NotFoundFailure()
          : ServerFailure(statusCode);
    case DioExceptionType.unknown when exception.error is SocketException:
      return const NetworkFailure();
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      return UnknownFailure(exception);
  }
}
