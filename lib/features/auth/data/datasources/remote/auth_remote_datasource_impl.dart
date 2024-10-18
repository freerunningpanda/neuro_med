import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/core/data/core_data.dart';
import 'package:upmind_front_client/core/utils/constants/api_keys.dart';
import 'package:upmind_front_client/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:upmind_front_client/features/auth/data/models/auth_data_model.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_login.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  const AuthRemoteDatasourceImpl(
    this._dio,
    this._cookieJar,
    this._talker,
  );

  final Dio _dio;
  final CookieJar _cookieJar;
  final Talker _talker;

  @override
  Future<(AuthDataModel, UserModel)> loginUser(UserLoginParams params) async =>
      RequestHandler.sendRequest<(AuthDataModel, UserModel),
          Map<String, dynamic>>(
        talker: _talker,
        request: () => _dio.post(
          ApiKeys.auth,
          data: {
            'username': params.username,
            'password': params.password,
          },
        ),
        converter: (json) async {
          final cookies =
              await _cookieJar.loadForRequest(Uri.parse(_dio.options.baseUrl));
          final cookieHeader = cookies
              .map((cookie) => '${cookie.name}=${cookie.value}')
              .join('; ');

          final userData =
              UserModel.fromJson(json['user'] as Map<String, dynamic>);

          final authData = AuthDataModel.fromCookieJar(cookieHeader);

          return (authData, userData);
        },
      );

  @override
  Future<void> logoutUser() async =>
      RequestHandler.sendRequest<void, Map<String, dynamic>>(
        talker: _talker,
        request: () => _dio.post(ApiKeys.logout),
        converter: (_) => {},
      );
}
