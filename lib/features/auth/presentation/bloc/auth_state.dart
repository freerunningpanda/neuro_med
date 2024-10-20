part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthIdle extends AuthState {
  const AuthIdle();
}

final class AuthSuccess extends AuthState {
  const AuthSuccess({
    required this.user,
  });

  final User user;

  @override
  List<Object> get props => [user];
}

final class AuthError extends AuthState {
  const AuthError();
}
