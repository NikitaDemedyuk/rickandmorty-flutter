import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/network/dio_error_mapper.dart';

void main() {
  final requestOptions = RequestOptions(path: '/character');

  DioException exception(
    DioExceptionType type, {
    int? statusCode,
    Object? error,
  }) => DioException(
    requestOptions: requestOptions,
    type: type,
    error: error,
    response: statusCode == null
        ? null
        : Response<void>(
            requestOptions: requestOptions,
            statusCode: statusCode,
          ),
  );

  group('mapDioException', () {
    for (final type in [
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.transformTimeout,
      DioExceptionType.connectionError,
    ]) {
      test('maps $type to NetworkFailure', () {
        expect(mapDioException(exception(type)), const NetworkFailure());
      });
    }

    for (final error in <IOException>[
      const SocketException('Failed host lookup'),
      const HttpException('Connection closed before full header was received'),
      const HandshakeException('Handshake error in client'),
    ]) {
      test('maps an unknown ${error.runtimeType} to NetworkFailure', () {
        final e = exception(DioExceptionType.unknown, error: error);

        expect(mapDioException(e), const NetworkFailure());
      });
    }

    test('maps a 404 response to NotFoundFailure', () {
      final e = exception(DioExceptionType.badResponse, statusCode: 404);

      expect(mapDioException(e), const NotFoundFailure());
    });

    test('maps other bad responses to ServerFailure with the status code', () {
      final e = exception(DioExceptionType.badResponse, statusCode: 500);

      expect(mapDioException(e), const ServerFailure(500));
    });

    test('maps a bad response without a status code to ServerFailure', () {
      final e = DioException.badResponse(
        statusCode: 0,
        requestOptions: requestOptions,
        response: Response<void>(requestOptions: requestOptions),
      );

      expect(mapDioException(e), const ServerFailure());
    });

    for (final type in [
      DioExceptionType.cancel,
      DioExceptionType.badCertificate,
      DioExceptionType.unknown,
    ]) {
      test('maps $type to UnknownFailure carrying the exception', () {
        final e = exception(type, error: StateError('boom'));

        expect(
          mapDioException(e),
          isA<UnknownFailure>().having((f) => f.error, 'error', same(e)),
        );
      });
    }
  });
}
