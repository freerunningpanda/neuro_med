import 'package:equatable/equatable.dart';

class AuthData extends Equatable {
  const AuthData({required this.cookie});

  final String? cookie;

  @override
  List<Object?> get props => [cookie];
}
