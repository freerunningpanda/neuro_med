import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/router_cubit/router_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_typo.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/enums/bottom_nav_bar_color.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    required this.tabsRouter,
    super.key,
  });

  final TabsRouter tabsRouter;

  /// Обработчик навигации.
  void _navigationHandler(
    BuildContext context, {
    required int index,
    required RouterState state,
    required UserRole role,
  }) {
    switch (role) {
      case UserRole.guest:
        // Такое решение, потому что через [tabsRouter] нельзя.

        // Проверяем, соответствует ли индекс табу авторизации.
        if (index == 1) {
          // Если уже был переход, то не выполняем его.
          if (state.isNavigated) {
            return;
          }
          // Если текущий маршрут не экран авторизации, выполняем переход.
          // Пушим новый маршрут.
          // Чтобы мы могли вернуться на предыдущий экран через AppBar.
          context.push(const AuthRoute());
          // Устанавливаем флаг, что был переход.
          // Чтобы не выполнять переход повторно.
          context.read<RouterCubit>().setNavigation(isNavigated: true);
        } else {
          // Если это не таб авторизации, просто меняем активный индекс.
          tabsRouter.setActiveIndex(index);
          // Устанавливаем флаг, что не было перехода.
          context.read<RouterCubit>().setNavigation(isNavigated: false);
        }

      case UserRole.patient:
        if (index == 1) {
          return;
        }
        tabsRouter.setActiveIndex(index);
        context.navigate(const MainRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = const AppTypo().captionTypo.c1;
    return BlocBuilder<RouterCubit, RouterState>(
      builder: (_, routerState) => BlocBuilder<AuthBloc, AuthState>(
        builder: (_, state) => state.maybeWhen(
          success: (userRole) => BottomNavigationBar(
            backgroundColor: BottomNavBarColor.getBackgroundColor(
              context,
              userRole,
            ),
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _navigationHandler(
              context,
              index: index,
              state: routerState,
              role: userRole,
            ),
            items: UserRole.getBottomNavigationBar(context, userRole),
            selectedItemColor: BottomNavBarColor.getSelectedItemColor(
              context,
              userRole,
            ),
            unselectedItemColor: BottomNavBarColor.getUnselectedItemColor(
              context,
              userRole,
            ),
            selectedLabelStyle: labelStyle,
            unselectedLabelStyle: labelStyle,
            selectedIconTheme: context.theme.iconTheme,
          ),
          orElse: () => BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _navigationHandler(
              context,
              index: index,
              state: routerState,
              role: UserRole.guest,
            ),
            items: UserRole.getBottomNavigationBar(context, UserRole.guest),
            selectedItemColor: context.theme.colorScheme.onPrimary,
            unselectedItemColor: context.theme.colorScheme.onSecondary,
            selectedLabelStyle: labelStyle,
            unselectedLabelStyle: labelStyle,
            selectedIconTheme: context.theme.iconTheme,
          ),
        ),
      ),
    );
  }
}
