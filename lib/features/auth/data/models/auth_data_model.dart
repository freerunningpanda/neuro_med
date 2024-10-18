import 'package:equatable/equatable.dart';

class AuthDataModel extends Equatable {
  const AuthDataModel({required this.cookie});

  factory AuthDataModel.fromCookieJar(String cookie) =>
      AuthDataModel(cookie: cookie);

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      AuthDataModel(cookie: json['cookie'] as String);

  final String? cookie;

  Map<String, dynamic> toJson() => {
        'cookie': cookie,
      };

  @override
  List<Object?> get props => [cookie];
}
