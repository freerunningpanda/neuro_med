import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_notifications_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/notifications_settings_section.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/user_data_section.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/cubit/notifications_switcher_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget implements AutoRouteWrapper {
  const SettingsScreen({
    required this.previousScreenTitle,
    super.key,
  });

  /// Название предыдущего экрана.
  final String previousScreenTitle;

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: ActiveAppBar(
          screenTitle: previousScreenTitle,
          trailing: AppNotificationsButton(
            onTap: () => context.push(
              NotificationsRoute(
                previousScreenTitle: context.tr.settings,
              ),
            ),
          ),
        ),
        body: DefaultAppCanvas(
          hasCross: true,
          title: context.tr.settings,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (_, state) => switch (state) {
              AuthSuccess _ => switch (state.user.role) {
                  UserRole.patient => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UserDataSection(),
                        const AppDivider(),
                        NotificationsSettingsSection(
                          user: state.user,
                        ),
                        const AppDivider(),
                      ],
                    ),
                  _ => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NotificationsSettingsSection(
                          user: state.user,
                        ),
                        const AppDivider(),
                      ],
                    ),
                },
              _ => const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationsSettingsSection(),
                    AppDivider(),
                  ],
                ),
            },
          ),
        ),
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => sl<NotificationsSwitcherCubit>(),
        child: this,
      );
}
