import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_icon.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AppSettingsButton extends StatelessWidget {
  const AppSettingsButton({
    required this.onTap,
    super.key,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => AppRippleButton(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.all(AppConstants.commonSize4),
          child: AppIcon(
            Icons.settings,
          ),
        ),
      );
}
