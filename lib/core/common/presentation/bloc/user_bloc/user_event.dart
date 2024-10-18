part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUser() = _GetUser;
  const factory UserEvent.deleteUserFromBase() = _DeleteUserFromBase;
  const factory UserEvent.softDeleteUser({required int userId}) =
      _SoftDeleteUser;
}
