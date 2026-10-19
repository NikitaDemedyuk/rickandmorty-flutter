import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';

void main() {
  final themes = {
    'light': (AppTheme.light, Brightness.light, const Color(0xFF55A630)),
    'dark': (AppTheme.dark, Brightness.dark, const Color(0xFF7CC957)),
  };

  for (final MapEntry(key: name, value: (theme, brightness, alive))
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
        expect(statusColors.alive, alive);
      });
    });
  }
}
