import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_error.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/logout_button_widget.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';

/// Секция с данными пользователя.
class UserDataSection extends StatelessWidget {
  const UserDataSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.commonSize24,
      ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (_, state) => switch (state) {
          AuthIdle _ => const SizedBox.shrink(),
          final AuthSuccess _ => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppConstants.commonSize16,
                    bottom: AppConstants.commonSize12,
                  ),
                  child: Text(
                    context.tr.myData,
                    style: theme.primaryTextTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                if (state.user.firstName != null)
                  _UserDataWidget(
                    title: context.tr.name,
                    value: state.user.firstName!,
                  ),
                AppConstants.sizedBoxH12,
                if (state.user.email != null)
                  _UserDataWidget(
                    title: context.tr.email,
                    value: state.user.email!,
                  ),
                AppConstants.sizedBoxH24,
                const LogoutButtonWidget(),
              ],
            ),
          AuthError _ => const AppError()
        },
      ),
    );
  }
}

class _UserDataWidget extends StatelessWidget {
  const _UserDataWidget({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.primaryTextTheme.titleSmall,
        ),
        Text(
          value,
          style: theme.primaryTextTheme.bodyMedium,
        ),
      ],
    );
  }
}
