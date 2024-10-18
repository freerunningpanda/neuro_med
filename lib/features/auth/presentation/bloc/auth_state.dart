part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.idle() = _Idle;
  const factory AuthState.success({
    required UserRole userRole,
  }) = _UserRole;
  const factory AuthState.error() = _Error;
}
