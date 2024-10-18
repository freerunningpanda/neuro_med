import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AreasWidget extends StatelessWidget {
  const AreasWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.commonSize16,
          vertical: AppConstants.commonSize6,
        ),
        decoration: BoxDecoration(
          color: context.theme.dividerTheme.color,
          borderRadius: BorderRadius.circular(AppConstants.commonRadius4),
        ),
        child: Text(
          context.tr.areas,
          style: context.theme.primaryTextTheme.labelLarge,
        ),
      );
}
