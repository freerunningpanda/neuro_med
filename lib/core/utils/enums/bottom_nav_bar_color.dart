import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';

/// Цвет нижнего навигационного бара.
enum BottomNavBarColor {
  primary,
  secondary;

  /// Получение цвета фона в зависимости от роли пользователя.
  static Color getBackgroundColor(BuildContext context, UserRole role) =>
      switch (role) {
        UserRole.guest => context.theme.colorScheme.primary,
        UserRole.patient => context.theme.colorScheme.onPrimary,
      };

  static Color getSelectedItemColor(BuildContext context, UserRole role) =>
      switch (role) {
        UserRole.guest => context.theme.colorScheme.onPrimary,
        UserRole.patient => context.theme.colorScheme.primary,
      };

  static Color getUnselectedItemColor(BuildContext context, UserRole role) =>
      switch (role) {
        UserRole.guest => context.theme.colorScheme.onSecondary,
        UserRole.patient => context.theme.colorScheme.primary,
      };
}
