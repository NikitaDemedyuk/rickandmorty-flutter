import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/app/di.dart';
import 'package:rickandmorty/core/network/dio_client.dart';
import 'package:rickandmorty/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';

void main() {
  late GetIt getIt;

  setUp(() {
    getIt = GetIt.asNewInstance();
    configureDependencies(getIt);
  });

  test('registers a Dio pointed at the Rick and Morty API', () {
    final dio = getIt<Dio>();
    expect(dio.options.baseUrl, rickAndMortyApiBaseUrl);
    expect(identical(dio, getIt<Dio>()), isTrue);
  });

  test('registers the characters repository as a singleton', () {
    final repository = getIt<CharactersRepository>();
    expect(repository, isA<CharactersRepositoryImpl>());
    expect(identical(repository, getIt<CharactersRepository>()), isTrue);
  });

  test('registers the image cache manager', () {
    // Not resolved: DefaultCacheManager needs platform plugins.
    expect(getIt.isRegistered<BaseCacheManager>(), isTrue);
  });
}
