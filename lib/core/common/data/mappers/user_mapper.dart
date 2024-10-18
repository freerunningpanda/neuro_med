import 'package:upmind_front_client/core/common/data/models/user_model/user_model.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';

extension UserFromModelMapper on UserModel {
  User toUserUIEntity() => User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        role: UserRole.getRole(role),
      );
}

extension UserToModelMapper on User {
  UserModel toUserModel() => UserModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        role: role.toString(),
      );
}
