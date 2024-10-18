import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/features/auth/data/models/auth_data_model.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_login.dart';

// ignore: one_member_abstracts
abstract class AuthRemoteDatasource {
  Future<(AuthDataModel, UserModel)> loginUser(UserLoginParams params);
  Future<void> logoutUser();
}
