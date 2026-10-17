import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/app/di.dart';
import 'package:rickandmorty/core/network/dio_client.dart';

void main() {
  test('registers a Dio pointed at the Rick and Morty API', () {
    final getIt = GetIt.asNewInstance();
    configureDependencies(getIt);

    final dio = getIt<Dio>();
    expect(dio.options.baseUrl, rickAndMortyApiBaseUrl);
    expect(identical(dio, getIt<Dio>()), isTrue);
  });
}
