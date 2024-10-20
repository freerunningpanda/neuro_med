import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';

/// Тип пользователя.
enum UserRole {
  guest,
  patient;

  /// Получение нижнего навигационного бара в зависимости от типа пользователя.
  static List<BottomNavigationBarItem> getBottomNavigationBar(
    BuildContext context, {
    User? user,
  }) =>
      switch (user?.role) {
        UserRole.guest => _defaultBottomNavBarList(context),
        UserRole.patient => [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.bottomNavBar.main.path,
                colorFilter: ColorFilter.mode(
                  context.theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
              label: context.tr.main,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  AppConstants.sizedBoxH10,
                  if (user!.firstName != null)
                    Text(
                      user.firstName!.substring(0, 2),
                      style: context.theme.primaryTextTheme.headlineMedium
                          ?.copyWith(color: context.theme.colorScheme.primary),
                    ),
                ],
              ),
              label: '',
            ),
          ],
        _ => _defaultBottomNavBarList(context),
      };

  /// Список элементов нижнего навигационного бара.
  /// Для неавторизованного пользователя.
  static List<BottomNavigationBarItem> _defaultBottomNavBarList(
    BuildContext context,
  ) {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Assets.icons.bottomNavBar.main.path,
          colorFilter: ColorFilter.mode(
            context.theme.colorScheme.onSecondary,
            BlendMode.srcIn,
          ), // Цвет для неактивного состояния
        ),
        label: context.tr.main,
        activeIcon: SvgPicture.asset(
          Assets.icons.bottomNavBar.main.path,
          colorFilter: ColorFilter.mode(
            context.theme.colorScheme.onPrimary,
            BlendMode.srcIn,
          ), // Цвет для неактивного состояния
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Assets.icons.bottomNavBar.login.path,
          colorFilter: ColorFilter.mode(
            context.theme.colorScheme.onSecondary,
            BlendMode.srcIn,
          ), // Цвет для неактивного состояния
        ),
        label: context.tr.login,
        activeIcon: SvgPicture.asset(
          Assets.icons.bottomNavBar.login.path,
          colorFilter: ColorFilter.mode(
            context.theme.colorScheme.onPrimary,
            BlendMode.srcIn,
          ), // Цвет для неактивного состояния
        ),
      ),
    ];
  }

  static UserRole parse(String role) => switch (role) {
        'guest' => UserRole.guest,
        'patient' => UserRole.patient,
        _ => UserRole.guest,
      };
}
