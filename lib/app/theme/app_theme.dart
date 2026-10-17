import 'package:material_ui/material_ui.dart';

abstract final class AppTheme {
  static const Color _portalGreen = Color(0xFF97CE4C);

  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _portalGreen),
  );
}
