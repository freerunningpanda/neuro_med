import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/splash_screen/domain/repositories/splash_screen_repository.dart';

class GetImagePath extends UseCase<String, NoParams> {
  const GetImagePath(this._repository);

  final SplashScreenRepository _repository;

  @override
  Future<Either<Failure, String>> call(NoParams params) =>
      _repository.getImagePath();
}
