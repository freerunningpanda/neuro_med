part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class _CheckAuthEvent extends AuthEvent {
  const _CheckAuthEvent();
}

final class LoginUserEvent extends AuthEvent {
  const LoginUserEvent({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;
}

final class LogoutUserEvent extends AuthEvent {
  const LogoutUserEvent();
}
