import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_settings_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/user_notifications/domain/entities/user_notification.dart';

@RoutePage()
class UserNotificationDetailsScreen extends StatelessWidget {
  const UserNotificationDetailsScreen({
    required this.previousScreenTitle,
    required this.userNotification,
    super.key,
  });

  /// Название предыдущего экрана.
  final String previousScreenTitle;

  final UserNotification userNotification;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppScaffold(
      appBar: ActiveAppBar(
        screenTitle: previousScreenTitle,
        trailing: AppSettingsButton(
          onTap: () => context.push(
            SettingsRoute(
              previousScreenTitle: userNotification.title,
            ),
          ),
        ),
      ),
      body: DefaultAppCanvas(
        title: userNotification.title,
        showBottomDivider: false,
        child: Container(
          padding: const EdgeInsets.all(AppConstants.commonSize24),
          width: double.infinity,
          color: context.theme.dividerTheme.color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: AppConstants.commonSize6,
                ),
                child: Text(
                  userNotification.date,
                  style: theme.primaryTextTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.inverseSurface,
                  ),
                ),
              ),
              Text(
                userNotification.body,
                style: theme.primaryTextTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
