import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/common/data/mappers/user_mapper.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/network/network_info.dart';
import 'package:upmind_front_client/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:upmind_front_client/features/auth/data/datasources/mappers/auth_data_mapper.dart';
import 'package:upmind_front_client/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:upmind_front_client/features/auth/domain/entities/auth_data.dart';
import 'package:upmind_front_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_login.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl(
    this._localDatasource,
    this._remoteDatasource,
    this._networkInfo, {
    required super.logger,
  });

  final AuthLocalDatasource _localDatasource;
  final AuthRemoteDatasource _remoteDatasource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, (AuthData, User)>> loginUser(
    UserLoginParams params,
  ) async =>
      execute(() => _loginUser(params), const AuthDatasourceFailure());

  Future<(AuthData, User)> _loginUser(UserLoginParams params) async {
    final hasConnection = await _networkInfo.hasConnection;

    if (!hasConnection) {
      throw NoConnectionFailure();
    }

    final remoteData = await _remoteDatasource.loginUser(params);
    // Получаем данные авторизации
    final authData = remoteData.$1;
    // Получаем данные пользователя
    final user = remoteData.$2;

    await _localDatasource.deleteAuthData();
    await _localDatasource.writeAuthData((authData, user));

    return (
      authData.toUIEntityData(),
      user.toUserUIEntity(),
    );
  }

  @override
  Future<Either<Failure, (AuthData?, User?)?>> checkAuth() async =>
      execute(_checkAuth, const AuthDatasourceFailure());

  Future<(AuthData?, User?)?> _checkAuth() async {
    // TODO(frerunningpanda): авторизация будет переписана
    // С использования кук на токен
    final localData = await _localDatasource.getAuthData();
    // Получаем локальные данные авторизации
    final authData = localData?.$1;
    // Получаем локальные данные пользователя
    final user = localData?.$2;

    if (authData == null || user == null) {
      return null;
    }

    return (
      authData.toUIEntityData(),
      user.toUserUIEntity(),
    );
  }

  @override
  Future<Either<Failure, void>> logoutUser() async =>
      execute(_logoutUser, const AuthDatasourceFailure());

  Future<void> _logoutUser() async {
    final hasConnection = await _networkInfo.hasConnection;
    if (!hasConnection) {
      await _localDatasource.deleteAuthData();
    }

    await _remoteDatasource.logoutUser();
    await _localDatasource.deleteAuthData();
  }
}
