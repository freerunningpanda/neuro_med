import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/auth/domain/entities/auth_data.dart';
import 'package:upmind_front_client/features/auth/domain/repositories/auth_repository.dart';

class CheckAuth extends UseCase<(AuthData?, User?)?, NoParams> {
  const CheckAuth(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, (AuthData?, User?)?>> call(NoParams params) async =>
      _repository.checkAuth();
}
