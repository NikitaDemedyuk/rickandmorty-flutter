import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String rickAndMortyApiBaseUrl = 'https://rickandmortyapi.com/api';

Dio createDio({
  String baseUrl = rickAndMortyApiBaseUrl,
  bool enableLogging = kDebugMode,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: const {Headers.acceptHeader: Headers.jsonContentType},
    ),
  );
  if (enableLogging) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        responseHeader: false,
        logPrint: (message) => debugPrint('[dio] $message'),
      ),
    );
  }
  return dio;
}
