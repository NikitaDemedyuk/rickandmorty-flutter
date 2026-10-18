import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/status_colors.dart';

void main() {
  const black = Color(0xFF000000);
  const white = Color(0xFFFFFFFF);
  const colors = StatusColors(alive: black, dead: black, unknown: black);

  group('StatusColors', () {
    test('compares by value', () {
      // Not const: const instances are canonicalized and compare by identity.
      // ignore: prefer_const_constructors
      final other = StatusColors(alive: black, dead: black, unknown: black);

      expect(other, colors);
      expect(other.hashCode, colors.hashCode);
      expect(colors.copyWith(dead: white), isNot(colors));
    });

    test('copyWith replaces only the given colors', () {
      expect(
        colors.copyWith(alive: white),
        const StatusColors(alive: white, dead: black, unknown: black),
      );
    });

    test('lerp interpolates every color', () {
      const target = StatusColors(alive: white, dead: white, unknown: white);
      final halfway = Color.lerp(black, white, 0.5)!;

      expect(
        colors.lerp(target, 0.5),
        StatusColors(alive: halfway, dead: halfway, unknown: halfway),
      );
    });

    test('lerp to null keeps the colors', () {
      expect(colors.lerp(null, 0.5), colors);
    });
  });
}
