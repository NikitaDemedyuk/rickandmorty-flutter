import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';

void main() {
  // The alive color as ARGB: an int compares by value, a const Color literal
  // would be canonicalized and could compare by identity.
  final themes = {
    'light': (AppTheme.light, Brightness.light, 0xFF266D00),
    'dark': (AppTheme.dark, Brightness.dark, 0xFF86DB5F),
  };

  for (final MapEntry(key: name, value: (theme, brightness, aliveArgb))
      in themes.entries) {
    group('AppTheme.$name', () {
      test('uses a $name color scheme', () {
        expect(theme.colorScheme.brightness, brightness);
      });

      test('registers StatusColors derived from its color scheme', () {
        final statusColors = theme.extension<StatusColors>();

        expect(statusColors, isNotNull);
        expect(statusColors!.dead, theme.colorScheme.error);
        expect(statusColors.unknown, theme.colorScheme.onSurfaceVariant);
        expect(statusColors.alive.toARGB32(), aliveArgb);
      });
    });
  }
}
