import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/network/dio_error_mapper.dart';

import '../../helpers/dio_exceptions.dart';

void main() {
  group('mapDioException', () {
    for (final type in [
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.transformTimeout,
    ]) {
      test('maps $type to TimeoutFailure', () {
        expect(mapDioException(dioException(type)), const TimeoutFailure());
      });
    }

    for (final type in [
      DioExceptionType.connectionTimeout,
      DioExceptionType.connectionError,
    ]) {
      test('maps $type to NetworkFailure', () {
        expect(mapDioException(dioException(type)), const NetworkFailure());
      });
    }

    for (final error in <IOException>[
      const SocketException('Failed host lookup'),
      const HttpException('Connection closed before full header was received'),
      const HandshakeException('Handshake error in client'),
    ]) {
      test('maps an unknown ${error.runtimeType} to NetworkFailure', () {
        final e = dioException(DioExceptionType.unknown, error: error);

        expect(mapDioException(e), const NetworkFailure());
      });
    }

    test('maps a 404 response to NotFoundFailure', () {
      final e = dioException(DioExceptionType.badResponse, statusCode: 404);

      expect(mapDioException(e), const NotFoundFailure());
    });

    test('maps a 429 response to RateLimitFailure', () {
      final e = dioException(DioExceptionType.badResponse, statusCode: 429);

      expect(mapDioException(e), const RateLimitFailure());
    });

    test('keeps the Retry-After delay of a 429 response', () {
      final e = dioException(
        DioExceptionType.badResponse,
        statusCode: 429,
        headers: {
          HttpHeaders.retryAfterHeader: ['120'],
        },
      );

      expect(
        mapDioException(e),
        const RateLimitFailure(Duration(seconds: 120)),
      );
    });

    test('ignores a Retry-After that is not a number of seconds', () {
      final e = dioException(
        DioExceptionType.badResponse,
        statusCode: 429,
        headers: {
          HttpHeaders.retryAfterHeader: ['Wed, 21 Oct 2026 07:28:00 GMT'],
        },
      );

      expect(mapDioException(e), const RateLimitFailure());
    });

    test('maps other bad responses to ServerFailure with the status code', () {
      final e = dioException(DioExceptionType.badResponse, statusCode: 500);

      expect(mapDioException(e), const ServerFailure(500));
    });

    test('maps a bad response without a status code to ServerFailure', () {
      final requestOptions = RequestOptions(path: '/character');
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
        final e = dioException(type, error: StateError('boom'));

        expect(
          mapDioException(e),
          isA<UnknownFailure>().having((f) => f.error, 'error', same(e)),
        );
      });
    }
  });
}
