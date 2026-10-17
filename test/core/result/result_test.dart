import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/core/result/result.dart';

void main() {
  group('Result.fold', () {
    test('calls ok with the value for Ok', () {
      const Result<int> result = Ok(42);

      expect(result.fold(ok: (v) => 'ok $v', err: (_) => 'err'), 'ok 42');
    });

    test('calls err with the failure for Err', () {
      const Result<int> result = Err(NotFoundFailure());

      expect(
        result.fold(ok: (_) => null, err: (f) => f),
        const NotFoundFailure(),
      );
    });
  });

  test('variants compare by value', () {
    expect(const Ok(1), const Ok(1));
    expect(const Ok(1), isNot(const Ok(2)));
    expect(
      const Err<int>(ServerFailure(500)),
      const Err<int>(ServerFailure(500)),
    );
    expect(
      const Err<int>(ServerFailure(500)),
      isNot(const Err<int>(NetworkFailure())),
    );
  });
}
