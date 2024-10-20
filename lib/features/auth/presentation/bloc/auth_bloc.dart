import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/check_auth.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_login.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';

typedef _Emit = Emitter<AuthState>;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._userLogin,
    this._userLogout,
    this._checkAuth,
  ) : super(
          const AuthIdle(),
        ) {
    on<_CheckAuthEvent>(_onCheckAuth);
    on<LoginUserEvent>(_onLoginUser);
    on<LogoutUserEvent>(_onLogoutUser);

    add(const _CheckAuthEvent());
  }

  final UserLogin _userLogin;
  final UserLogout _userLogout;
  final CheckAuth _checkAuth;

  /// Авторизация пользователя
  Future<void> _onLoginUser(LoginUserEvent event, _Emit emit) async {
    emit(const AuthIdle());
    final response = await _userLogin.call(
      UserLoginParams(
        username: event.login,
        password: event.password,
      ),
    );

    response.fold(
      (error) {
        emit(const AuthError());
      },
      (authInfo) {
        emit(
          AuthSuccess(
            user: authInfo.$2,
          ),
        );
      },
    );
  }

  /// Выход пользователя
  Future<void> _onLogoutUser(LogoutUserEvent event, _Emit emit) async {
    final response = await _userLogout.call(NoParams());

    response.fold((_) {
      emit(const AuthError());
      emit(const AuthIdle());
    }, (_) {
      emit(const AuthIdle());
    });
  }

  /// Проверка авторизации
  Future<void> _onCheckAuth(_CheckAuthEvent event, _Emit emit) async {
    final response = await _checkAuth.call(NoParams());

    response.fold(
      (error) {
        // Эмитим состояние ошибки
        emit(
          const AuthError(),
        );
        // Эмитим роль гостя
        emit(
          const AuthIdle(),
        );
      },
      (authInfo) {
        final authData = authInfo?.$1;
        final user = authInfo?.$2;

        // Если данные авторизации или пользователя отсутствуют
        if (authData == null || user == null) {
          // Эмитим роль гостя
          emit(
            const AuthIdle(),
          );
          return;
        }
        emit(
          AuthSuccess(
            user: user,
          ),
        );
      },
    );
  }
}
