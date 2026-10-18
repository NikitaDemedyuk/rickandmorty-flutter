import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/status_colors.dart';

abstract final class AppTheme {
  static const Color _portalGreen = Color(0xFF97CE4C);
  static const Color _aliveGreen = Color(0xFF55A630);

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: _portalGreen,
  );

  static final ThemeData light = ThemeData(
    colorScheme: _lightScheme,
    extensions: [
      StatusColors(
        alive: _aliveGreen,
        dead: _lightScheme.error,
        unknown: _lightScheme.onSurfaceVariant,
      ),
    ],
  );
}
