import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.commonSize24,
        vertical: AppConstants.commonSize24,
      ),
      child: AppRippleButton(
        onTap: () => context.push(
          ContactTheAdminRoute(
            previousScreenTitle: context.tr.loginToPersonalAccount,
          ),
        ),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: theme.primaryTextTheme.labelMedium,
                text: context.tr.noCredentials,
                children: [
                  TextSpan(
                    text: context.tr.contactAdmin,
                    style: theme.primaryTextTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
