import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_notifications_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_settings_button.dart';
import 'package:upmind_front_client/core/core.dart';

class AppAllButtons extends StatelessWidget {
  const AppAllButtons({
    required this.previousScreenTitle,
    super.key,
  });

  /// Название предыдущего экрана.
  final String previousScreenTitle;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AppSettingsButton(
            onTap: () => context.push(
              SettingsRoute(
                previousScreenTitle: previousScreenTitle,
              ),
            ),
          ),
          AppNotificationsButton(
            onTap: () => context.push(
              NotificationsRoute(
                previousScreenTitle: previousScreenTitle,
              ),
            ),
          ),
        ],
      );
}
