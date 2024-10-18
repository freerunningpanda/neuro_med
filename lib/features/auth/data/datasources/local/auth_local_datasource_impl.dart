import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:upmind_front_client/features/auth/data/models/auth_data_model.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  AuthLocalDatasourceImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  final String _authDataKey = 'auth_data';
  final String _userKey = 'user';

  @override
  Future<void> deleteAuthData() async {
    try {
      // Удаляем данные авторизации
      await Future.sync(() => _secureStorage.delete(key: _authDataKey));
      // Удаляем данные пользователя
      await Future.sync(() => _secureStorage.delete(key: _userKey));
    } on Exception catch (e, trace) {
      throw SecureStorageException(
        error: e,
        trace: trace,
      );
    }
  }

  @override
  Future<(AuthDataModel?, UserModel?)> getAuthData() async {
    try {
      final authDataJson = await _secureStorage.read(key: _authDataKey);
      final userJson = await _secureStorage.read(key: _userKey);
      return (authDataJson != null && userJson != null)
          ? (
              AuthDataModel.fromJson(
                jsonDecode(authDataJson) as Map<String, dynamic>,
              ),
              UserModel.fromJson(
                jsonDecode(userJson) as Map<String, dynamic>,
              ),
            )
          : (null, null);
    } catch (e, trace) {
      throw SecureStorageException(
        error: e,
        trace: trace,
      );
    }
  }

  @override
  Future<void> writeAuthData((AuthDataModel, UserModel) data) async {
    try {
      // Записываем данные авторизации
      await _secureStorage.write(
        key: _authDataKey,
        value: jsonEncode(data.$1.toJson()),
      );
      // Записываем данные пользователя
      await _secureStorage.write(
        key: _userKey,
        value: jsonEncode(
          data.$2.toJson(),
        ),
      );
    } catch (e, trace) {
      throw SecureStorageException(
        error: e,
        trace: trace,
      );
    }
  }
}
