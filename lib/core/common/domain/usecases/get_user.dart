import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/common/domain/repositories/user_repository.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';

class GetUser extends UseCase<User, NoParams> {
  const GetUser(this._repository);
  
  final UserRepository _repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) => _repository.getUser();
}
