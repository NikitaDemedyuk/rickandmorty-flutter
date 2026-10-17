import 'package:material_ui/material_ui.dart';

abstract final class AppTheme {
  // Portal green.
  static const Color _seed = Color(0xFF97CE4C);

  static ThemeData get light =>
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed));
}
