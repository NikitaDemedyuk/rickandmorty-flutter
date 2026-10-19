import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';

abstract final class AppTheme {
  static const Color _portalGreen = Color(0xFF97CE4C);
  static const Color _aliveGreen = Color(0xFF55A630);
  static const Color _aliveGreenDark = Color(0xFF7CC957);

  static final ThemeData light = _build(Brightness.light, alive: _aliveGreen);

  static final ThemeData dark = _build(Brightness.dark, alive: _aliveGreenDark);

  /// Each theme builds its own [StatusColors] from its scheme, since the
  /// extension copies the roles instead of following the scheme.
  static ThemeData _build(Brightness brightness, {required Color alive}) {
    final scheme = ColorScheme.fromSeed(
      seedColor: _portalGreen,
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: scheme,
      extensions: [
        StatusColors(
          alive: alive,
          dead: scheme.error,
          unknown: scheme.onSurfaceVariant,
        ),
      ],
    );
  }
}
