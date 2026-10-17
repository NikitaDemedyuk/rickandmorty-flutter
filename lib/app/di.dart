import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/core/network/dio_client.dart';

/// Composition root. The only place, besides route builders, that touches
/// [GetIt].
void configureDependencies(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(createDio);
}
