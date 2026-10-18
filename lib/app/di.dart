import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/core/network/dio_client.dart';
import 'package:rickandmorty/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:rickandmorty/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:rickandmorty/features/characters/domain/repositories/characters_repository.dart';

/// Composition root. The only place, besides route builders, that touches
/// [GetIt].
void configureDependencies(GetIt getIt) {
  getIt
    ..registerLazySingleton<Dio>(createDio)
    ..registerLazySingleton(() => CharactersRemoteDataSource(getIt<Dio>()))
    ..registerLazySingleton<CharactersRepository>(
      () => CharactersRepositoryImpl(getIt<CharactersRemoteDataSource>()),
    )
    ..registerLazySingleton<BaseCacheManager>(DefaultCacheManager.new);
}
