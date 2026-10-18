// Regenerates every platform app icon from the 1024 px sources in
// `assets/icon/`. Run it from the project root after editing a source:
//
//   fvm dart run tool/generate_app_icons.dart
//
// CI runs it too and fails if a committed icon differs from its output.

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:image/image.dart';

const _sources = 'assets/icon';
const _androidRes = 'android/app/src/main/res';
const _iosIconSet = 'ios/Runner/Assets.xcassets/AppIcon.appiconset';

/// Android density buckets and their scale relative to mdpi.
const Map<String, num> _densities = {
  'mdpi': 1,
  'hdpi': 1.5,
  'xhdpi': 2,
  'xxhdpi': 3,
  'xxxhdpi': 4,
};

/// Legacy launcher icons are 48 dp; adaptive icon layers are 108 dp, of
/// which a launcher shows at most the middle 72 dp.
const _legacyDp = 48;
const _adaptiveDp = 108;
const _adaptiveVisibleDp = 72;

void main() {
  // The App Store rejects an app icon with an alpha channel.
  final master = _read('icon.png').convert(numChannels: 3);
  final legacy = _read('icon_legacy_round.png');
  final layers = {
    'ic_launcher_background': _read('icon_background.png'),
    'ic_launcher_foreground': _read('icon_foreground.png'),
    'ic_launcher_monochrome': _read('icon_monochrome.png'),
  };

  for (final MapEntry(key: density, value: scale) in _densities.entries) {
    final dir = '$_androidRes/mipmap-$density';
    _write('$dir/ic_launcher.png', _resize(legacy, _legacyDp * scale));
    for (final MapEntry(key: name, value: layer) in layers.entries) {
      _write('$dir/$name.png', _resize(layer, _adaptiveDp * scale));
    }
  }

  // The dark and tinted icons (iOS 18+) show the adaptive foreground's
  // visible area, which draws the portal at about the master's size. The dark
  // one keeps a transparent background: iOS fills in its own dark one.
  final dark = _zoom(
    layers['ic_launcher_foreground']!,
    _adaptiveDp / _adaptiveVisibleDp,
  );
  final iosArt = <String?, Image>{
    null: master,
    'dark': dark,
    'tinted': _tinted(dark),
  };
  // The asset catalog's Contents.json lists every iOS slot.
  for (final slot in _iosSlots()) {
    final art = iosArt[slot.appearance];
    if (art == null) throw StateError('No art for ${slot.appearance} icons');
    _write('$_iosIconSet/${slot.filename}', _resize(art, slot.pixels));
  }
}

typedef _IosSlot = ({String filename, num pixels, String? appearance});

Iterable<_IosSlot> _iosSlots() sync* {
  final file = File('$_iosIconSet/Contents.json');
  final contents = jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
  for (final entry in contents['images']! as List<Object?>) {
    final image = entry! as Map<String, Object?>;
    final filename = image['filename'] as String?;
    // Xcode keeps slots it has no file for; there is nothing to write.
    if (filename == null) continue;
    final points = num.parse((image['size']! as String).split('x').first);
    final scale = num.parse(
      (image['scale'] as String? ?? '1x').split('x').first,
    );
    final appearances = image['appearances'] as List<Object?>? ?? const [];
    final appearance = appearances
        .map((a) => (a! as Map<String, Object?>)['value'] as String?)
        .firstOrNull;
    yield (filename: filename, pixels: points * scale, appearance: appearance);
  }
}

Image _read(String name) {
  final bytes = File('$_sources/$name').readAsBytesSync();
  final image = decodePng(bytes);
  if (image == null) throw FormatException('Not a PNG', name);
  return image.convert(format: Format.uint8);
}

void _write(String path, Image image) =>
    File(path).writeAsBytesSync(encodePng(image));

/// Downscales a square [src] to [size] px with an area-weighted box filter
/// on premultiplied alpha: each output pixel averages exactly the source
/// area it covers, and transparent pixels (stored as black) don't darken the
/// edges of the art. The result keeps the source's channels, so opaque
/// layers stay RGB.
Image _resize(Image src, num size) {
  final out = size.round();
  if (out == src.width) return src.clone();
  final from = src.convert(numChannels: 4).getBytes(order: ChannelOrder.rgba);
  final to = List<int>.filled(out * out * 4, 0);
  final step = src.width / out;
  for (var y = 0; y < out; y++) {
    final top = y * step;
    final bottom = top + step;
    for (var x = 0; x < out; x++) {
      final left = x * step;
      final right = left + step;
      var r = 0.0;
      var g = 0.0;
      var b = 0.0;
      var a = 0.0;
      for (var sy = top.floor(); sy < min(bottom.ceil(), src.height); sy++) {
        final wy = _overlap(sy, top, bottom);
        for (var sx = left.floor(); sx < min(right.ceil(), src.width); sx++) {
          final w = wy * _overlap(sx, left, right);
          final i = (sy * src.width + sx) * 4;
          final alpha = from[i + 3] * w;
          r += from[i] * alpha;
          g += from[i + 1] * alpha;
          b += from[i + 2] * alpha;
          a += alpha;
        }
      }
      final o = (y * out + x) * 4;
      if (a > 0) {
        to[o] = (r / a).round();
        to[o + 1] = (g / a).round();
        to[o + 2] = (b / a).round();
        to[o + 3] = (a / (step * step)).round();
      }
    }
  }
  return Image.fromBytes(
    width: out,
    height: out,
    bytes: Uint8List.fromList(to).buffer,
    numChannels: 4,
  ).convert(numChannels: src.numChannels);
}

/// How much of source pixel [i] (the span `[i, i + 1)`) lies inside
/// `[start, end)`.
double _overlap(int i, double start, double end) {
  final lo = i < start ? start : i.toDouble();
  final hi = i + 1 > end ? end : i + 1.0;
  return hi - lo;
}

/// Enlarges the middle `1 / zoom` of a square [src] back to its full size,
/// interpolating bilinearly on premultiplied alpha.
Image _zoom(Image src, double zoom) {
  final size = src.width;
  final from = src.convert(numChannels: 4).getBytes(order: ChannelOrder.rgba);
  final to = Uint8List(size * size * 4);
  final step = 1 / zoom;
  final origin = (size - size * step) / 2;
  final sample = List<double>.filled(4, 0);
  for (var y = 0; y < size; y++) {
    final sy = (origin + (y + 0.5) * step - 0.5).clamp(0, size - 1.0);
    final y0 = sy.floor();
    final y1 = min(y0 + 1, size - 1);
    final fy = sy - y0;
    for (var x = 0; x < size; x++) {
      final sx = (origin + (x + 0.5) * step - 0.5).clamp(0, size - 1.0);
      final x0 = sx.floor();
      final x1 = min(x0 + 1, size - 1);
      final fx = sx - x0;
      sample.fillRange(0, 4, 0);
      for (final (px, py, w) in [
        (x0, y0, (1 - fx) * (1 - fy)),
        (x1, y0, fx * (1 - fy)),
        (x0, y1, (1 - fx) * fy),
        (x1, y1, fx * fy),
      ]) {
        final i = (py * size + px) * 4;
        final alpha = from[i + 3] * w;
        for (var c = 0; c < 3; c++) {
          sample[c] += from[i + c] * alpha;
        }
        sample[3] += alpha;
      }
      final o = (y * size + x) * 4;
      final a = sample[3];
      if (a > 0) {
        for (var c = 0; c < 3; c++) {
          to[o + c] = (sample[c] / a).round();
        }
        to[o + 3] = a.round();
      }
    }
  }
  return Image.fromBytes(
    width: size,
    height: size,
    bytes: to.buffer,
    numChannels: 4,
  );
}

/// The opaque grayscale image iOS tints: [src]'s luminance over black.
Image _tinted(Image src) {
  final from = src.convert(numChannels: 4).getBytes(order: ChannelOrder.rgba);
  final to = Uint8List(src.width * src.height * 3);
  for (var i = 0, o = 0; i < from.length; i += 4, o += 3) {
    final luma = 0.299 * from[i] + 0.587 * from[i + 1] + 0.114 * from[i + 2];
    to.fillRange(o, o + 3, (luma * from[i + 3] / 255).round());
  }
  return Image.fromBytes(
    width: src.width,
    height: src.height,
    bytes: to.buffer,
    numChannels: 3,
  );
}
