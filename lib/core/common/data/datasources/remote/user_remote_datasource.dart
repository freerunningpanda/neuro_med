import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';

// ignore: one_member_abstracts
abstract class UserRemoteDatasource {
  Future<UserModel> getUser();
}
