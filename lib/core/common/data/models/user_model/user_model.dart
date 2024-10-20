import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        email: json['email'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        role: UserRole.parse(json['role'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'role': role.name,
      };
}
