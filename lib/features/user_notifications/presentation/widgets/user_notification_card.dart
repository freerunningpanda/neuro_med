import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/user_notifications/domain/entities/user_notification.dart';

class UserNotificationCard extends StatelessWidget {
  const UserNotificationCard({
    required this.notification,
    super.key,
  });

  final UserNotification notification;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppConstants.commonSize24,
            vertical: AppConstants.commonSize8,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.date,
                style: theme.primaryTextTheme.displaySmall?.copyWith(
                  color: theme.colorScheme.inverseSurface,
                  fontSize: AppConstants.commonSize14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.commonSize8,
                ),
                child: Text(
                  notification.title,
                  style: theme.primaryTextTheme.titleLarge?.copyWith(
                    fontSize: AppConstants.commonSize16,
                  ),
                ),
              ),
            ],
          ),
          subtitle: Column(
            children: [
              Text(
                notification.body,
                style: theme.primaryTextTheme.displaySmall?.copyWith(
                  color: theme.colorScheme.inverseSurface,
                  fontSize: AppConstants.commonSize14,
                ),
              ),
            ],
          ),
          trailing: SvgGenImage(Assets.icons.common.details.path).svg(),
        ),
        const AppDivider(),
      ],
    );
  }
}
