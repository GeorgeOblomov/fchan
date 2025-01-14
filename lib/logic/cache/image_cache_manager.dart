import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class ImageCacheManager extends BaseCacheManager {
  static final String _key = 'imageCache';

  static ImageCacheManager _instance;

  ImageCacheManager._() : super(_key);

  factory ImageCacheManager() {
    if (_instance == null) {
      _instance = ImageCacheManager._();
    }
    return _instance;
  }

  @override
  Future<String> getFilePath() async {
    final directory = await getApplicationSupportDirectory();
    return '${directory.path}/$_key';
  }
}
