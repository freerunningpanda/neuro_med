part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded(User user) = _Loaded;
  const factory UserState.navigate({
    required UserNavigate navigate,
  }) = _Navigate;
  const factory UserState.error({User? user, String? error}) = _Error;
}
