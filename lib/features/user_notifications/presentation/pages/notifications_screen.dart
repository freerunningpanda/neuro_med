import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_error.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_settings_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/custom_progress_indicator.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/bloc/user_notifications_bloc.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/widgets/user_notification_card.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    required this.previousScreenTitle,
    super.key,
  });

  /// Название предыдущего экрана.
  final String previousScreenTitle;

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: ActiveAppBar(
          screenTitle: previousScreenTitle,
          trailing: AppSettingsButton(
            onTap: () => context.push(
              SettingsRoute(
                previousScreenTitle: context.tr.notifications,
              ),
            ),
          ),
        ),
        body: DefaultAppCanvas(
          title: context.tr.notifications,
          hasCross: true,
          child: BlocBuilder<UserNotificationsBloc, UserNotificationsState>(
            builder: (_, state) => switch (state) {
              UserNotificationsLoading _ => Center(
                  child: CustomProgressIndicator.instance.progressIndicator,
                ),
              UserNotificationsLoaded(notifications: final notifications) =>
                ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (_, index) {
                    final notification = notifications[index];

                    return AppRippleButton(
                      onTap: () => context.push(
                        UserNotificationDetailsRoute(
                          previousScreenTitle: context.tr.notifications,
                          userNotification: notification,
                        ),
                      ),
                      child: UserNotificationCard(notification: notification),
                    );
                  },
                ),
              UserNotificationsError _ => AppError(
                  onPressed: () => context
                    ..read<UserNotificationsBloc>().add(
                      const LoadUserNotifications(),
                    ),
                ),
            },
          ),
        ),
      );
}
