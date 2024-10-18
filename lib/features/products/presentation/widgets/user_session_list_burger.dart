import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/core/utils/params/localization_params.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class UserSessionListBurger extends StatelessWidget {
  const UserSessionListBurger({
    required this.userVideoList,
    super.key,
  });

  final IList<UserVideo> userVideoList;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppConstants.commonSize6,
                bottom: AppConstants.commonSize4,
              ),
              child: Container(
                width: AppConstants.bottomWidgetWidth,
                decoration: BoxDecoration(
                  color: theme.dividerTheme.color,
                  borderRadius: BorderRadius.circular(
                    AppConstants.commonRadius4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.commonSize4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: AppConstants.commonSize8,
                        ),
                        child: Text(
                          context.tr.sessions,
                          style: theme.primaryTextTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                      SvgGenImage(
                        Assets.icons.common.expand.path,
                      ).svg(),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              LocalizationParams(
                param1: context.tr.done,
                param2: userVideoList
                    .where(
                      (video) => video.status == Status.done,
                    )
                    .toList()
                    .length
                    .toString(),
                param3: context.tr.from,
                param4: userVideoList.length.toString(),
              ).getString(),
              style: theme.primaryTextTheme.bodySmall?.copyWith(
                color: theme.colorScheme.inverseSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
