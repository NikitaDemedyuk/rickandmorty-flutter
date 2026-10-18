import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/error/failure.dart';

void main() {
  group('RateLimitFailure', () {
    test('equals another RateLimitFailure with the same hashCode', () {
      expect(const RateLimitFailure(), const RateLimitFailure());
      expect(
        const RateLimitFailure().hashCode,
        const RateLimitFailure().hashCode,
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
}
