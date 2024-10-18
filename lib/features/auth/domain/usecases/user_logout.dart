import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/auth/domain/repositories/auth_repository.dart';

class UserLogout extends UseCase<void, NoParams> {
  const UserLogout(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      _repository.logoutUser();
}
