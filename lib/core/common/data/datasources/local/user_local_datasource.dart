import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';

abstract class UserLocalDatasource {
  Future<UserModel?> getUser();
  Future<void> writeUser(UserModel user);
  Future<void> deleteUser();
}
