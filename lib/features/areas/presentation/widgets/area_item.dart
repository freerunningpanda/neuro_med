import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/areas/domain/entities/area.dart';

class AreaItem extends StatelessWidget {
  const AreaItem({
    required this.area,
    super.key,
  });

  final Area area;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: AppConstants.commonSize8,
          ),
          child: Image.network(
            area.thumbnail,
            fit: BoxFit.cover,
            width: AppConstants.userProgramImageSize,
            height: AppConstants.areaItemImageHeight,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                area.name,
                style: context.theme.primaryTextTheme.titleLarge,
              ),
              AppConstants.sizedBoxH6,
              Text(
                area.description,
                style: context.theme.primaryTextTheme.displaySmall?.copyWith(
                  color: theme.disabledColor,
                ),
              ),
            ],
          ),
        ),
        SvgGenImage(Assets.icons.common.details.path).svg(),
      ],
    );
  }
}
