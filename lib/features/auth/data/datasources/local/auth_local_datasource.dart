import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/features/auth/data/models/auth_data_model.dart';

abstract class AuthLocalDatasource {
  Future<void> writeAuthData((AuthDataModel, UserModel) data);
  Future<void> deleteAuthData();
  Future<(AuthDataModel?, UserModel?)?> getAuthData();
}
