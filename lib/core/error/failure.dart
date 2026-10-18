import 'package:flutter/foundation.dart' show immutable;

/// A domain-level error. Blocs keep it as is; the UI maps it to a localized
/// message via `failureMessage`.
@immutable
sealed class Failure {
  const new();
}

/// Equality for failures without fields: equal when the type matches.
/// `toString` stays per class, since `runtimeType` names are obfuscated in
/// release builds.
@immutable
mixin _TypeEquality {
  @override
  bool operator ==(Object other) => other.runtimeType == runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// No connection: the device is offline or the host is unreachable.
final class NetworkFailure extends Failure with _TypeEquality {
  const new();

  @override
  String toString() => 'NetworkFailure()';
}

/// The connection was made but the server took too long to answer.
final class TimeoutFailure extends Failure with _TypeEquality {
  const new();

  @override
  String toString() => 'TimeoutFailure()';
}

/// The server answered with an unexpected status code.
final class ServerFailure extends Failure {
  const new([this.statusCode]);

  final int? statusCode;

  @override
  bool operator ==(Object other) =>
      other is ServerFailure && other.statusCode == statusCode;

  @override
  int get hashCode => Object.hash(ServerFailure, statusCode);

  @override
  String toString() => 'ServerFailure($statusCode)';
}

/// The requested resource does not exist (HTTP 404).
final class NotFoundFailure extends Failure with _TypeEquality {
  const new();

  @override
  String toString() => 'NotFoundFailure()';
}

/// The API is throttling this client (HTTP 429).
final class RateLimitFailure extends Failure {
  const new([this.retryAfter]);

  /// How long the API asked to wait (`Retry-After`), if it said.
  final Duration? retryAfter;

  @override
  bool operator ==(Object other) =>
      other is RateLimitFailure && other.retryAfter == retryAfter;

  @override
  int get hashCode => Object.hash(RateLimitFailure, retryAfter);

  @override
  String toString() => 'RateLimitFailure($retryAfter)';
}

/// Anything else, including cancelled requests.
final class UnknownFailure extends Failure with _TypeEquality {
  const new([this.error]);

  /// Kept for debugging only; excluded from equality because exceptions
  /// compare by identity.
  final Object? error;

  @override
  String toString() => 'UnknownFailure($error)';
}
