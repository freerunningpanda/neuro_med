import 'package:upmind_front_client/features/auth/domain/entities/auth_data.dart';

class AuthDataModel extends AuthData {
  const AuthDataModel({required super.cookie});

  factory AuthDataModel.fromCookieJar(String cookie) =>
      AuthDataModel(cookie: cookie);

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      AuthDataModel(cookie: json['cookie'] as String);

  Map<String, dynamic> toJson() => {
        'cookie': cookie,
      };

  @override
  List<Object?> get props => [cookie];
}
