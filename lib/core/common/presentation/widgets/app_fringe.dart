import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AppFringe extends StatelessWidget {
  const AppFringe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppConstants.commonSize8,
        bottom: AppConstants.commonSize26,
      ),
      width: AppConstants.commonSize46,
      height: AppConstants.commonSize4,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
