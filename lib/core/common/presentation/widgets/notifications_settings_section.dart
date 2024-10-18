import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_notifications_switcher.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/enums/notifications_type.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/cubit/notifications_switcher_cubit.dart';

class NotificationsSettingsSection extends StatelessWidget {
  const NotificationsSettingsSection({
    required this.userRole,
    super.key,
  });

  final UserRole userRole;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppConstants.commonSize24,
        top: AppConstants.commonSize12,
        right: AppConstants.commonSize24,
        bottom: AppConstants.commonSize12,
      ),
      child:
          BlocBuilder<NotificationsSwitcherCubit, NotificationsSwitcherState>(
        builder: (_, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr.notificationSettings,
              style: theme.primaryTextTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            AppConstants.sizedBoxH24,
            AppNotificationsSwitcher(
              title: context.tr.pushNotifications,
              isActive: state.isPushNotificationsEnabled,
              type: NotificationsType.push,
            ),
            if (userRole != UserRole.guest)
              AppNotificationsSwitcher(
                title: context.tr.emailNotifications,
                isActive: state.isEmailNotificationsEnabled,
                type: NotificationsType.email,
              ),
          ],
        ),
      ),
    );
  }
}
