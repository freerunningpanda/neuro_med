import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/connection_checker/connection_checker_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/utils/app_snackbar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/bottom_navigation_bar/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/helpers/bloc_providers_helper.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/check_auth.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()

/// Экран навигации.
class NavigationScreen extends StatelessWidget implements AutoRouteWrapper {
  NavigationScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: NavigationScreenBlocProviders.instance.providers,
        child: this,
      );

  final CheckAuth _checkAuth = sl<CheckAuth>();

  /// Список слушателей блоков.
  List<SingleChildWidget> _getListeners(BuildContext context) => [
        BlocListener<ConnectionCheckerCubit, ConnectionCheckerState>(
          listener: (_, state) => !state.isConnected
              ? AppSnackbar.show(
                  context,
                  title: context.tr.noConnection,
                  message: context.tr.offlineMode,
                )
              : null,
        ),
        BlocListener<AuthBloc, AuthState>(
            listener: (_, state) => switch (state) {
                  AuthIdle _ => _checkAuth.call(NoParams()),
                  _ => null,
                }),
      ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // Установка цвета статус-бара.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: theme.colorScheme.primary,
      ),
    );

    return MultiBlocListener(
      listeners: _getListeners(context),
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        body: AutoTabsRouter(
          routes: const [
            MainRoute(),
            AuthRoute(),
          ],
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            final isPortrait =
                MediaQuery.of(context).orientation == Orientation.portrait;

            return Scaffold(
              body: child,
              bottomNavigationBar: isPortrait
                  ? BottomNavBarWidget(tabsRouter: tabsRouter)
                  : null,
            );
          },
        ),
      ),
    );
  }
}
