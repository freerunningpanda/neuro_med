import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class ViewedVideoButton extends StatelessWidget {
  const ViewedVideoButton({
    required this.title,
    this.backgroundColor,
    this.onPressed,
    super.key,
  });

  final String title;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const height = 30.0;
    const width = 212.0;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppConstants.commonRadius6,
          ),
        ),
        gradient: LinearGradient(
          stops: AppConstants.btnGradientStops,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppConstants.btnGradientColors,
        ),
      ),
      child: AppRippleButton(
        onTap: onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.commonSize16,
            ),
            child: Text(
              title,
              style: theme.primaryTextTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
