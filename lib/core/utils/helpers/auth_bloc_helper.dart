import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';

class AuthBlocHelper {
  AuthBlocHelper._();

  /// Получение состояния ошибки авторизации.
  static bool getErrorState(BuildContext context) {
    final isAuthErrorState = context.select<AuthBloc, bool>(
      (bloc) => bloc.state == const AuthError(),
    );

    return isAuthErrorState;
  }
}
