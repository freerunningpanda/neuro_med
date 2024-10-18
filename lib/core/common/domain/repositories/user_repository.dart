import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/core.dart';

// ignore: one_member_abstracts
abstract class UserRepository {
  Future<Either<Failure, User>> getUser();
}
