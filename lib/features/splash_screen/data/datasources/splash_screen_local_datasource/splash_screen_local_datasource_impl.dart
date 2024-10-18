import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/splash_screen/data/datasources/splash_screen_local_datasource/splash_screen_local_datasource.dart';

class SplashScreenLocalDatasourceImpl implements SplashScreenLocalDatasource {
  SplashScreenLocalDatasourceImpl(this._prefs);

  final SharedPreferences _prefs;

  final String _imageIndexKey = 'imageIndex';

  static final IList<String> imagePaths = IList<String>([
    Assets.images.splashFirst.path,
    Assets.images.splashSecond.path,
    Assets.images.splashThird.path,
  ]);

  @override
  Future<int?> getImageIndex() async {
    try {
      final index = _prefs.getInt(_imageIndexKey);
      return index;
    } catch (e, trace) {
      throw SharedPreferenceException(
        error: e,
        trace: trace,
      );
    }
  }

  @override
  Future<void> writeImageIndex(int index) async {
    try {
      await _prefs.setInt(_imageIndexKey, index);
    } catch (e, trace) {
      throw SharedPreferenceException(
        error: e,
        trace: trace,
      );
    }
  }
}
