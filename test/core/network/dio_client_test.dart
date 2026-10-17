import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/network/dio_client.dart';

void main() {
  test('configures base URL and timeouts', () {
    final dio = createDio(enableLogging: false);

    expect(dio.options.baseUrl, rickAndMortyApiBaseUrl);
    expect(dio.options.connectTimeout, const Duration(seconds: 10));
    expect(dio.options.receiveTimeout, const Duration(seconds: 10));
    expect(dio.interceptors.whereType<LogInterceptor>(), isEmpty);
  });

  test('adds a LogInterceptor in debug mode by default', () {
    final dio = createDio();

    expect(dio.interceptors.whereType<LogInterceptor>(), hasLength(1));
  });
}
