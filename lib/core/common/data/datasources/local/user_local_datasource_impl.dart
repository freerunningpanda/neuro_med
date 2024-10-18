import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:upmind_front_client/core/common/data/datasources/local/user_local_datasource.dart';
import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/core/core.dart';

class UserLocalDatasourceImpl implements UserLocalDatasource {
  UserLocalDatasourceImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  final String userKey = 'user';

  @override
  Future<void> deleteUser() async {
    try {
      return Future.sync(() => _secureStorage.delete(key: userKey));
    } on Exception catch (e, trace) {
      throw SecureStorageException(error: e, trace: trace);
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      final jsonString = await _secureStorage.read(key: userKey);
      return jsonString != null
          ? UserModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>)
          : null;
    } catch (e, trace) {
      throw SecureStorageException(error: e, trace: trace);
    }
  }

  @override
  Future<void> writeUser(UserModel user) async {
    try {
      await _secureStorage.write(
        key: userKey,
        value: jsonEncode(
          user.toJson(),
        ),
      );
    } catch (e, trace) {
      throw SecureStorageException(error: e, trace: trace);
    }
  }
}
