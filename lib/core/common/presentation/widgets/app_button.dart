import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    this.backgroundColor,
    this.onPressed,
    super.key,
  });

  final String title;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Container(
        height: AppConstants.buttonHeight,
        width: AppConstants.buttonWidth,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppConstants.commonRadius6,
            ),
          ),
          gradient: onPressed != null
              ? LinearGradient(
                  stops: AppConstants.btnGradientStops,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppConstants.btnGradientColors,
                )
              : null,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: context.theme.primaryTextTheme.bodyLarge,
          ),
        ),
      );
}
