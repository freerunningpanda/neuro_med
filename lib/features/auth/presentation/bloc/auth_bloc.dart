import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/check_auth.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_login.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

typedef _Emit = Emitter<AuthState>;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._userLogin,
    this._userLogout,
    this._checkAuth,
  ) : super(
          const AuthState.idle(),
        ) {
    on<_CheckAuth>(_onCheckAuth);
    on<_LoginUser>(_onLoginUser);
    on<_LogoutUser>(_onLogoutUser);
  }

  final UserLogin _userLogin;
  final UserLogout _userLogout;
  final CheckAuth _checkAuth;

  /// Авторизация пользователя
  Future<void> _onLoginUser(_LoginUser event, _Emit emit) async {
    emit(const AuthState.idle());
    final response = await _userLogin.call(
      UserLoginParams(
        username: event.login,
        password: event.password,
      ),
    );

    response.fold(
      (error) {
        emit(const AuthState.error());
      },
      (authInfo) {
        emit(
          AuthState.success(
            userRole: authInfo.$2.role,
          ),
        );
      },
    );
  }

  /// Выход пользователя
  Future<void> _onLogoutUser(_LogoutUser event, _Emit emit) async {
    final response = await _userLogout.call(NoParams());

    response.fold((_) {
      emit(const AuthState.error());
      emit(const AuthState.idle());
    }, (_) {
      emit(const AuthState.idle());
    });
  }

  /// Проверка авторизации
  Future<void> _onCheckAuth(_CheckAuth event, _Emit emit) async {
    final response = await _checkAuth.call(NoParams());

    response.fold(
      (error) {
        // Эмитим состояние ошибки
        emit(
          const AuthState.error(),
        );
        // Эмитим роль гостя
        emit(
          const AuthState.idle(),
        );
      },
      (authInfo) {
        final authData = authInfo?.$1;
        final user = authInfo?.$2;

        // Если данные авторизации или пользователя отсутствуют
        if (authData == null || user == null) {
          // Эмитим роль гостя
          emit(
            const AuthState.idle(),
          );
          return;
        }
        emit(
          AuthState.success(
            userRole: user.role,
          ),
        );
      },
    );
  }
}
