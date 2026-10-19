import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('main Android manifest declares INTERNET (release builds need it)', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml')
        .readAsStringSync();

    expect(manifest, contains('android.permission.INTERNET'));
  });
}
