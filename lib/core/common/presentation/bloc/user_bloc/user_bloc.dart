import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/common/domain/usecases/get_user.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

enum UserNavigate { mainScreen, authScreen }

typedef _Emit = Emitter<UserState>;

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._getUser) : super(const UserState.loading()) {
    on<_GetUser>(_onGetUser);

    add(
      const UserEvent.getUser(),
    );
  }
  final GetUser _getUser;

  Future<void> _onGetUser(_GetUser event, _Emit emit) async {
    final response = await _getUser.call(NoParams());

    response.fold(
      (failure) {
        emit(const UserState.navigate(navigate: UserNavigate.authScreen));
        emit(UserState.error(error: failure.error));

        return;
      },
      (user) => emit(UserState.loaded(user)),
    );
  }
}
