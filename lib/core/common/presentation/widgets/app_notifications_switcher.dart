// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_swicher.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/enums/notifications_type.dart';

/// Отвечает за включение/выключение уведомлений.
class AppNotificationsSwitcher extends StatelessWidget {
  const AppNotificationsSwitcher({
    required this.title,
    required this.isActive,
    required this.type,
    super.key,
  });

  final String title;
  final bool isActive;
  final NotificationsType type;

  void onChanged(BuildContext context, bool value) {
    final newValue = !value;
    type.setNotificationSwitcher(
      context,
      type: type,
      value: newValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.primaryTextTheme.titleMedium,
        ),
        AppSwitcher(
          isActive: isActive,
          onChanged: (value) => onChanged(context, value),
        ),
      ],
    );
  }
}
