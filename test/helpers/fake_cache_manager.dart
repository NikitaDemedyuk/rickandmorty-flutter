import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mocktail/mocktail.dart';

/// Never delivers a file, so images stay on their placeholder and widget
/// tests never reach path_provider, sqflite or the network.
final class FakeCacheManager extends Fake implements BaseCacheManager {
  @override
  Stream<FileResponse> getFileStream(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
  }) => const Stream.empty();
}
