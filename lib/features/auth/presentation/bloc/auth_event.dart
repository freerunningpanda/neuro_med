part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;
  const factory AuthEvent.loginUser({
    required String login,
    required String password,
  }) = _LoginUser;
  const factory AuthEvent.logoutUser() = _LogoutUser;
}
