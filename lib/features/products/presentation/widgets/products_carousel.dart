import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/product_card_widget.dart';

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({
    required this.productsCategory,
    required this.userRole,
    super.key,
  });

  final Category productsCategory;
  final UserRole userRole;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppConstants.cardHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsCategory.products.length,
          itemBuilder: (_, index) {
            final product = productsCategory.products[index];

            return AppRippleButton(
              onTap: product.subProducts != null
                  ? () => context.push(
                        SubProductsRoute(
                          previousScreenTitle: context.tr.upmind_products,
                          product: product,
                        ),
                      )
                  : () => context.push(
                        ConsultingDoctorRoute(
                          previousScreenTitle: context.tr.upmind_products,
                          productTitle: product.name,
                        ),
                      ),
              child: ProductCardWidget(product: product),
            );
          },
        ),
      );
}
