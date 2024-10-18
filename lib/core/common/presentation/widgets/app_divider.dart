import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

/// Делитель для Canvas.
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: AppConstants.commonSize6,
        decoration: BoxDecoration(
          color: context.theme.dividerTheme.color,
          gradient: LinearGradient(
            colors: [
              context.theme.dividerTheme.color!.withOpacity(0.1),
              context.theme.dividerTheme.color!.withOpacity(0.2),
              context.theme.dividerTheme.color!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
}
