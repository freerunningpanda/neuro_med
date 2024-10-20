import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';

extension UserFromModelMapper on UserModel {
  User toUserUIEntity() => User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        role: role,
      );
}
