import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_product_header.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_products_carousel.dart';

class MyProgramsMain extends StatelessWidget {
  const MyProgramsMain({
    required this.userProductList,
    super.key,
  });

  final IList<UserProduct> userProductList;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.commonSize16,
            ),
            child: UserProductHeader(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppConstants.commonSize26,
            ),
            child: UserProductsCarousel(
              userProductList: userProductList,
            ),
          ),
          const AppDivider(),
        ],
      );
}
