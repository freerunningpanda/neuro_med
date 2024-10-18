import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/splash_screen/data/datasources/splash_screen_local_datasource/splash_screen_local_datasource.dart';
import 'package:upmind_front_client/features/splash_screen/data/datasources/splash_screen_local_datasource/splash_screen_local_datasource_impl.dart';
import 'package:upmind_front_client/features/splash_screen/domain/repositories/splash_screen_repository.dart';

class SplashScreenRepositoryImpl extends BaseRepository
    implements SplashScreenRepository {
  SplashScreenRepositoryImpl(
    this._localDatasource, {
    required super.logger,
  });

  final SplashScreenLocalDatasource _localDatasource;

  @override
  Future<Either<Failure, String>> getImagePath() async => execute(
        _getImagePath,
        const SplashScreenDatasourceFailure(),
      );

  Future<String> _getImagePath() async {
    /// Список фоновых изображений для splash screen.
    final images = SplashScreenLocalDatasourceImpl.imagePaths;

    /// Индекс изображения из локального хранилища.
    var localIndex = await _localDatasource.getImageIndex();

    if (localIndex == null) {
      // Если в локальном хранилище нет индекса, то записываем индекс 0.
      await _localDatasource.writeImageIndex(0);
    } else {
      // Если в локальном хранилище есть индекс, то увеличиваем его на 1.
      // При каждом запуске приложения будет показано следующее изображение.
      localIndex++;
      // Если индекс больше или равен длине списка изображений, то обнуляем его.
      if (localIndex >= images.length) {
        localIndex = 0;
      }
      // Записываем новый индекс в локальное хранилище.
      await _localDatasource.writeImageIndex(localIndex);
    }

    // Получаем индекс изображения.
    final index = await _localDatasource.getImageIndex();

    // Получаем путь к изображению по индексу.
    final imagePath = images[index ?? 0];

    return imagePath;
  }
}
