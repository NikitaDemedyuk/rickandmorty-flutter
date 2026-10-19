import 'dart:math' as math;

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

      // WCAG 1.4.11: the status dot is a non-text graphic, so it needs 3:1
      // against the surface the chip sits on.
      test('status colors keep 3:1 contrast on the surface', () {
        final statusColors = theme.extension<StatusColors>()!;
        final surface = theme.colorScheme.surface;

        for (final color in [
          statusColors.alive,
          statusColors.dead,
          statusColors.unknown,
        ]) {
          expect(_contrastRatio(color, surface), greaterThanOrEqualTo(3));
        }
      });
    });
  }
}

/// WCAG contrast ratio between two opaque colors.
double _contrastRatio(Color a, Color b) {
  final (la, lb) = (a.computeLuminance(), b.computeLuminance());
  return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
}
