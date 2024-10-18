import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_icon.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/notification_counter.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/bloc/user_notifications_bloc.dart';

class AppNotificationsButton extends StatelessWidget {
  const AppNotificationsButton({
    required this.onTap,
    super.key,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => AppRippleButton(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppConstants.commonSize4,
            top: AppConstants.commonSize4,
            right: AppConstants.commonSize4,
            bottom: AppConstants.commonSize4,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const AppIcon(
                Icons.notifications,
              ),
              BlocBuilder<UserNotificationsBloc, UserNotificationsState>(
                builder: (_, state) => switch (state) {
                  UserNotificationsLoaded(notifications: final notifications) =>
                    Positioned(
                      bottom: -AppConstants.commonSize2,
                      right: -AppConstants.commonSize4,
                      child: NotificationCounter(
                        counter: notifications.length,
                      ),
                    ),
                  _ => const SizedBox.shrink(),
                },
              ),
            ],
          ),
        ),
      );
}
