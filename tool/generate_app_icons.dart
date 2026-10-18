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

/// Legacy launcher icons are 48 dp; adaptive icon layers are 108 dp.
const _legacyDp = 48;
const _adaptiveDp = 108;

void main() {
  final master = _read('icon.png');
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

  // The asset catalog's Contents.json lists every iOS slot. The App Store
  // rejects icons with an alpha channel, so they are written as RGB.
  for (final slot in _iosSlots()) {
    final icon = _resize(master, slot.pixels).convert(numChannels: 3);
    _write('$_iosIconSet/${slot.filename}', icon);
  }
}

typedef _IosSlot = ({String filename, num pixels});

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
    yield (filename: filename, pixels: points * scale);
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
