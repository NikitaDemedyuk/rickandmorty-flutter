import 'dart:convert';
import 'dart:io';

/// Reads `test/fixtures/[name]` as a string.
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

/// Reads `test/fixtures/[name]` as a decoded JSON object.
Map<String, Object?> fixtureJson(String name) =>
    jsonDecode(fixture(name)) as Map<String, Object?>;
