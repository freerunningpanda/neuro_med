import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/dialog_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    required this.content,
    required this.buttonOneTitle,
    required this.buttonTwoTitle,
    required this.actionButtonOnTap,
    super.key,
  });

  final String title;
  final String content;
  final String buttonOneTitle;
  final String buttonTwoTitle;
  final void Function() actionButtonOnTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AlertDialog(
      titlePadding: const EdgeInsets.only(
        left: AppConstants.commonSize14,
        top: AppConstants.commonSize18,
        right: AppConstants.commonSize14,
        bottom: AppConstants.commonSize6,
      ),
      title: Text(
        title,
        style: theme.primaryTextTheme.headlineMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      content: Text(
        content,
        style: theme.primaryTextTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onTertiaryFixed,
        ),
      ),
      contentPadding: const EdgeInsets.only(
        left: AppConstants.commonSize14,
        top: AppConstants.commonSize6,
        right: AppConstants.commonSize14,
        bottom: AppConstants.commonSize18,
      ),
      actions: [
        DialogButton(
          text: buttonOneTitle,
          rightPadding: AppConstants.commonSize6,
          onTap: () => context.maybePop(),
        ),
        DialogButton(
          text: buttonTwoTitle,
          leftPadding: AppConstants.commonRadius6,
          onTap: actionButtonOnTap,
        ),
      ],
      actionsPadding: const EdgeInsets.only(
        left: AppConstants.commonSize20,
        right: AppConstants.commonSize20,
        bottom: AppConstants.commonSize16,
      ),
    );
  }
}
