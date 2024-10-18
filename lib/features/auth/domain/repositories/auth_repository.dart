import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/domain/entities/auth_data.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_login.dart';

abstract class AuthRepository {
  Future<Either<Failure, (AuthData, User)>> loginUser(UserLoginParams params);
  Future<Either<Failure, void>> logoutUser();
  Future<Either<Failure, (AuthData?, User?)?>> checkAuth();
}
