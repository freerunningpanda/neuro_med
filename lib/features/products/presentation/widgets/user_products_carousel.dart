import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_product_card_widget.dart';

class UserProductsCarousel extends StatelessWidget {
  const UserProductsCarousel({
    required this.userProductList,
    super.key,
  });

  final IList<UserProduct> userProductList;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppConstants.cardHeight,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: userProductList.length,
          itemBuilder: (_, index) {
            final userProduct = userProductList[index];

            return AppRippleButton(
              onTap: userProduct.status != Status.done
                  ? () => context.push(
                        UserProductDetailRoute(
                          title: userProduct.name,
                          previousScreenTitle: context.tr.upmind_products,
                          userVideoList: userProduct.videos,
                          userVideo: userProduct.videos.firstWhere(
                            (video) =>
                                video.status == Status.inProgress ||
                                video.status == Status.newLesson,
                          ),
                        ),
                      )
                  : null,
              child: UserProductCardWidget(userProduct: userProduct),
            );
          },
        ),
      );
}
