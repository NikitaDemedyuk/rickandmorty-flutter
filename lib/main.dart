import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/app.dart';
import 'package:rickandmorty/app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(GetIt.instance);
  runApp(const App());
}
