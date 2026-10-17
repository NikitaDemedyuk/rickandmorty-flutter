import 'dart:typed_data';

import 'package:dio/dio.dart';

/// Answers every request with the JSON set by [respond] and records the last
/// request, so data sources can be tested against a real [Dio].
final class FakeHttpClientAdapter implements HttpClientAdapter {
  String _body = '{}';
  int _statusCode = 200;

  RequestOptions? lastRequest;

  void respond(String body, {int statusCode = 200}) {
    _body = body;
    _statusCode = statusCode;
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastRequest = options;
    return ResponseBody.fromString(
      _body,
      _statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
