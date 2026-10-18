import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/app/theme/status_colors.dart';

void main() {
  group('AppTheme.light', () {
    test('registers StatusColors derived from its color scheme', () {
      final theme = AppTheme.light;
      final statusColors = theme.extension<StatusColors>();

      expect(statusColors, isNotNull);
      expect(statusColors!.dead, theme.colorScheme.error);
      expect(statusColors.unknown, theme.colorScheme.onSurfaceVariant);
    });
  });
}
