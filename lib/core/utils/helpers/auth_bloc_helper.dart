import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';

// TODO(freerunningpanda): подумать об отказе создания экземпляра класса.
class AuthBlocHelper {
  AuthBlocHelper._();
  static AuthBlocHelper instance = AuthBlocHelper._();

  /// Получение состояния ошибки авторизации.
  bool getErrorState(BuildContext context) {
    final isAuthErrorState = context.select<AuthBloc, bool>(
      (bloc) => bloc.state == const AuthError(),
    );

    return isAuthErrorState;
  }
}
