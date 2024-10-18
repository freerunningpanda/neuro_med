import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';

class UserProductCardWidget extends StatelessWidget {
  const UserProductCardWidget({
    required this.userProduct,
    this.width,
    super.key,
  });

  final UserProduct userProduct;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Card(
            elevation: 3,
            shadowColor: theme.dividerTheme.color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.commonSize8),
                      topRight: Radius.circular(AppConstants.commonSize8),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: userProduct.thumbnail,
                      height: AppConstants.cardHeight / 1.82,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.commonSize12,
                    vertical: AppConstants.commonSize8,
                  ),
                  child: SizedBox(
                    width: AppConstants.cardWidth - 60,
                    child: Text(
                      userProduct.name,
                      style: theme.primaryTextTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: AppConstants.commonSize0,
            right: AppConstants.commonSize0,
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.commonSize12),
              child:
                  SvgGenImage(userProduct.status.getNavigateIconPath()).svg(),
            ),
          ),
        ],
      ),
    );
  }
}
