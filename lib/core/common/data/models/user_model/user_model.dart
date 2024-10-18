import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.firstName,
    required this.role,
    this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        role: json['role'] as String,
      );
  final int id;
  final String? firstName;
  final String? lastName;
  final String role;

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'role': role,
      };

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        role,
      ];
}
