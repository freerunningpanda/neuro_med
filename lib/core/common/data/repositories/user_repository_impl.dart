import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/common/data/datasources/local/user_local_datasource.dart';
import 'package:upmind_front_client/core/common/data/datasources/remote/user_remote_datasource.dart';
import 'package:upmind_front_client/core/common/data/mappers/user_mapper.dart';
import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/common/domain/repositories/user_repository.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/network/network_info.dart';
import 'package:upmind_front_client/features/auth/data/datasources/local/auth_local_datasource.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
  UserRepositoryImpl(
    this.userLocalDataSource,
    this.userRemoteDataSource,
    this.authLocalDatasource,
    this.networkInfo, {
    required super.logger,
  });

  final UserLocalDatasource userLocalDataSource;
  final UserRemoteDatasource userRemoteDataSource;
  final AuthLocalDatasource authLocalDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, User>> getUser() async =>
      execute(_getUser, const UserDatasourceFailure());

  Future<User> _getUser() async {
    final hasConnection = await networkInfo.hasConnection;
    UserModel? user;
    final authData = await authLocalDatasource.getAuthData();

    if (authData == null) {
      throw const UserDatasourceFailure();
    }

    if (hasConnection) {
      user = await userRemoteDataSource.getUser();
      await userLocalDataSource.deleteUser();
      await userLocalDataSource.writeUser(user);

      return user.toUserUIEntity();
    }

    user = await userLocalDataSource.getUser();

    if (user == null) {
      throw const UserDatasourceFailure();
    }

    return user.toUserUIEntity();
  }
}
