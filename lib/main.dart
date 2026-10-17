import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/app.dart';
import 'package:rickandmorty/app/di.dart';

void main() {
  final getIt = GetIt.instance;
  configureDependencies(getIt);
  runApp(App(getIt: getIt));
}
