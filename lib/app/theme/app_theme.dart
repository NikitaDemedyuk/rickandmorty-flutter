import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';

abstract final class AppTheme {
  static const Color _portalGreen = Color(0xFF97CE4C);

  /// Seeds the "alive" status color. Each theme takes the `primary` of a
  /// scheme seeded with it, so the green gets the tone M3 pairs with that
  /// brightness's surfaces (as `error` does for "dead"); `fidelity` keeps
  /// the seed's chroma, so it stays a vivid green.
  static const Color _aliveGreen = Color(0xFF55A630);

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
        alive: ColorScheme.fromSeed(
          seedColor: _aliveGreen,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ).primary,
        dead: _lightScheme.error,
        unknown: _lightScheme.onSurfaceVariant,
      ),
    ],
  );

  static final ThemeData dark = ThemeData(
    colorScheme: _darkScheme,
    extensions: [
      StatusColors(
        alive: ColorScheme.fromSeed(
          seedColor: _aliveGreen,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ).primary,
        dead: _darkScheme.error,
        unknown: _darkScheme.onSurfaceVariant,
      ),
    ],
  );
}
