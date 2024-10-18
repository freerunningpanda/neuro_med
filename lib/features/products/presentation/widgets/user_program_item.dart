import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_status_label.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/core/utils/params/localization_params.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';

class UserProgramItem extends StatelessWidget {
  const UserProgramItem({
    required this.userProduct,
    super.key,
  });

  final UserProduct userProduct;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.commonSize24,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.commonSize12,
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: userProduct.thumbnail,
                  width: AppConstants.userProgramImageSize,
                  height: AppConstants.userProgramImageSize,
                ),
              ),
              AppConstants.sizedBoxW8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppStatusLabel(status: userProduct.status),
                  Text(
                    userProduct.name,
                    style: theme.primaryTextTheme.displayMedium,
                  ),
                  Text(
                    LocalizationParams(
                      param1: context.tr.moduleContains,
                      param2: context.tr.nSessions(userProduct.length),
                    ).getString(),
                    style: theme.primaryTextTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppConstants.commonSize6,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: theme.primaryTextTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        children: userProduct.status.getStatusText(
                          context,
                          userProduct: userProduct,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: AppConstants.commonSize24),
                child:
                    SvgGenImage(userProduct.status.getNavigateIconPath()).svg(),
              ),
            ],
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}
