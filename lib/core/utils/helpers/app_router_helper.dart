import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/router_cubit/router_cubit.dart';

/// Класс помощник для роутера
class AppRouterHelper {
  factory AppRouterHelper() => instance;
  AppRouterHelper._();
  static final AppRouterHelper instance = AppRouterHelper._();

  /// Переход на предыдущий экран
  void popRoute(BuildContext context, {bool? isAuthScreen}) {
    context.maybePop();
    // Сбрасываем навигацию, если это экран авторизации

    if (isAuthScreen ?? true) {
      context.read<RouterCubit>().setNavigation(isNavigated: false);
    }
  }
}
