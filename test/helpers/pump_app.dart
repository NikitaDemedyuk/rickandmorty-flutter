import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  /// Pumps [widget] inside a themed, localized [MaterialApp].
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        home: Scaffold(body: widget),
      ),
    );
  }
}
