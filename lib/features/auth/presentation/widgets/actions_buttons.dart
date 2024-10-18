import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/login_button.dart';

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({
    required this.formKey,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        AppConstants.sizedBoxH22,
        LoginButton(formKey: formKey),
        AppConstants.sizedBoxH2,
        AppRippleButton(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.commonSize6,
                  horizontal: AppConstants.commonSize14,
                ),
                child: Text(
                  context.tr.forgotPassword,
                  style: theme.primaryTextTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          onTap: () => context.push(
            ForgotPasswordRoute(
              previousScreenTitle: context.tr.loginToPersonalAccount,
            ),
          ),
        ),
        AppConstants.sizedBoxH24,
      ],
    );
  }
}
