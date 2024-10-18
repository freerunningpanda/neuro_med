import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/cubit/notifications_switcher_cubit.dart';

enum NotificationsType {
  push,
  email;

  /// Устанавливает переключатель уведомлений.
  void setNotificationSwitcher(
    BuildContext context, {
    required NotificationsType type,
    required bool value,
  }) =>
      switch (this) {
        NotificationsType.push =>
          context.read<NotificationsSwitcherCubit>().setPushNotifications(
                isActive: value,
              ),
        NotificationsType.email =>
          context.read<NotificationsSwitcherCubit>().setEmailNotifications(
                isActive: value,
              ),
      };
}
