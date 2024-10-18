import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class AppStatusLabel extends StatelessWidget {
  const AppStatusLabel({
    required this.status,
    super.key,
  });

  final Status status;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.commonSize4,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: status.getColor(),
            borderRadius: BorderRadius.circular(AppConstants.commonSize4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.commonSize10,
              vertical: AppConstants.commonSize2,
            ),
            child: SizedBox(
              width: AppConstants.userProgramImageSize,
              child: Text(
                status.getStatus(context),
                style: context.theme.primaryTextTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}
