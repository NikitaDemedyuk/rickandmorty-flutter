import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

extension SmallPhone on WidgetTester {
  /// Lays the test out on a 320×568 phone with 2x text, the tightest screen
  /// the app supports; both are reset when the test ends.
  void useSmallPhoneWith2xText() {
    view
      ..physicalSize = const Size(320, 568)
      ..devicePixelRatio = 1;
    addTearDown(view.reset);
    platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(platformDispatcher.clearTextScaleFactorTestValue);
  }
}
