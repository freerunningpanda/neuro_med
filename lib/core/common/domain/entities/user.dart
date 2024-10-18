import 'package:equatable/equatable.dart';

import 'package:upmind_front_client/core/utils/enums/user_role.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.firstName,
    required this.role,
    this.lastName,
  });
  final int id;
  final String? firstName;
  final String? lastName;
  final UserRole role;

  @override
  List<Object?> get props => [
        id,
        firstName,
        role,
        lastName,
      ];
}
