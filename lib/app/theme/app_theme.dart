import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';

abstract final class AppTheme {
  static const Color _portalGreen = Color(0xFF97CE4C);
  static const Color _aliveGreen = Color(0xFF55A630);
  static const Color _aliveGreenDark = Color(0xFF7CC957);

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: _portalGreen,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: _portalGreen,
    brightness: Brightness.dark,
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

  static final ThemeData dark = ThemeData(
    colorScheme: _darkScheme,
    extensions: [
      StatusColors(
        alive: _aliveGreenDark,
        dead: _darkScheme.error,
        unknown: _darkScheme.onSurfaceVariant,
      ),
    ],
  );
}
