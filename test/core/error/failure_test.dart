import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/error/failure.dart';

void main() {
  group('RateLimitFailure', () {
    test('equals another RateLimitFailure with the same hashCode', () {
      // Not const: const instances are canonicalized, so two of them are
      // identical and would match even without the == and hashCode overrides.
      // ignore: prefer_const_constructors
      final failure = RateLimitFailure(Duration(seconds: 1));

      expect(failure, const RateLimitFailure(Duration(seconds: 1)));
      expect(
        failure.hashCode,
        const RateLimitFailure(Duration(seconds: 1)).hashCode,
      );
    });

    test('differs by retryAfter', () {
      expect(
        const RateLimitFailure(Duration(seconds: 1)),
        isNot(const RateLimitFailure(Duration(seconds: 2))),
      );
      expect(
        const RateLimitFailure(Duration(seconds: 1)),
        isNot(const RateLimitFailure()),
      );
    });

    test('differs from the other failures', () {
      for (final other in <Failure>[
        const NetworkFailure(),
        const ServerFailure(429),
        const NotFoundFailure(),
        const UnknownFailure(),
      ]) {
        expect(const RateLimitFailure(), isNot(other));
        expect(other, isNot(const RateLimitFailure()));
      }
    });
  });

  group('ServerFailure', () {
    test('equals another ServerFailure with the same statusCode', () {
      // Not const, so the == and hashCode overrides actually run.
      // ignore: prefer_const_constructors
      final failure = ServerFailure(500);

      expect(failure, const ServerFailure(500));
      expect(failure.hashCode, const ServerFailure(500).hashCode);
    });

    test('differs by statusCode', () {
      expect(const ServerFailure(500), isNot(const ServerFailure(503)));
      expect(const ServerFailure(500), isNot(const ServerFailure()));
    });
  });

  group('UnknownFailure', () {
    test('ignores error in equality', () {
      final failure = UnknownFailure(StateError('first'));
      final other = UnknownFailure(StateError('second'));

      expect(failure, other);
      expect(failure.hashCode, other.hashCode);
    });
  });
}
