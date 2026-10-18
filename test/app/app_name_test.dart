import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/l10n/gen/app_localizations_en.dart';

/// Reads the first capture group of [pattern] in the file at [path].
String? _nativeValue(String path, String pattern) =>
    RegExp(pattern).firstMatch(File(path).readAsStringSync())?.group(1);

void main() {
  group('launcher name', () {
    final appTitle = AppLocalizationsEn().appTitle;

    test('Android label matches appTitle', () {
      expect(
        _nativeValue(
          'android/app/src/main/AndroidManifest.xml',
          'android:label="([^"]*)"',
        ),
        appTitle,
      );
    });

    test('iOS display name matches appTitle', () {
      expect(
        _nativeValue(
          'ios/Runner/Info.plist',
          r'<key>CFBundleDisplayName</key>\s*<string>([^<]*)</string>',
        ),
        appTitle,
      );
    });
  });
}
