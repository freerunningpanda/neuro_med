import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_dialog.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppRippleButton(
      onTap: () => showDialog<void>(
        context: context,
        builder: (context) => AppDialog(
          title: context.tr.logout,
          content: context.tr.logoutConfirm,
          buttonOneTitle: MaterialLocalizations.of(context).cancelButtonLabel,
          buttonTwoTitle: context.tr.logoutButton,
          actionButtonOnTap: () => context
            ..read<AuthBloc>().add(
              const AuthEvent.logoutUser(),
            )
            ..replaceAll([const MainRoute()])
            ..maybePop(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppConstants.commonSize8,
          right: AppConstants.commonSize8,
          bottom: AppConstants.commonSize24,
        ),
        child: Row(
          children: [
            SvgGenImage(Assets.icons.common.logout.path).svg(),
            // TODO(freerunningpanda): сделать по аналогии в других местах
            AppConstants.sizedBoxW10,
            Text(
              context.tr.logoutFromAccount,
              style: theme.primaryTextTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
