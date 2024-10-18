import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/splash_screen/domain/usecases/get_image_path.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(this._getImagePath)
      : super(
          SplashScreenState(
            imagePath: Assets.images.splashFirst.path,
          ),
        ) {
    init();
  }

  final GetImagePath _getImagePath;

  /// Инициализация кубита получения пути к изображению
  Future<void> init() async {
    final response = await _getImagePath.call(NoParams());

    response.fold(
      (_) => null,
      (imagePath) => emit(state.copyWith(imagePath: imagePath)),
    );
  }
}
