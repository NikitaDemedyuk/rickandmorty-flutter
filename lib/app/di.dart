import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/core/network/dio_client.dart';

/// Composition root. The only place, besides route builders, that touches
/// [GetIt].
Future<void> configureDependencies(GetIt getIt) async {
  getIt.registerLazySingleton<Dio>(createDio);
}
