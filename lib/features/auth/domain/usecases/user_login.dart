import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/auth/domain/entities/auth_data.dart';
import 'package:upmind_front_client/features/auth/domain/repositories/auth_repository.dart';

class UserLogin extends UseCase<(AuthData, User), UserLoginParams> {
  const UserLogin(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, (AuthData, User)>> call(
    UserLoginParams params,
  ) async =>
      _repository.loginUser(params);
}

class UserLoginParams extends Equatable {
  const UserLoginParams({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
