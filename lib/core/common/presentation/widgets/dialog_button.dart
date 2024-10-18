import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.text,
    required this.onTap,
    this.leftPadding,
    this.rightPadding,
    super.key,
  });

  final String text;
  final double? leftPadding;
  final double? rightPadding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return InkWell(
      borderRadius: BorderRadius.circular(
        AppConstants.commonRadius6,
      ),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: leftPadding ?? AppConstants.commonSize0,
          right: rightPadding ?? AppConstants.commonSize0,
        ),
        child: Text(
          text,
          style: theme.primaryTextTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
