import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_all_buttons.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/product_card_widget.dart';

@RoutePage()
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({
    required this.previousScreenTitle,
    required this.productList,
    required this.userRole,
    super.key,
  });

  /// Название предыдущего экрана.
  final String previousScreenTitle;
  final Category productList;
  final UserRole userRole;

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: ActiveAppBar(
          screenTitle: previousScreenTitle,
          trailing: AppAllButtons(
            previousScreenTitle: previousScreenTitle,
          ),
        ),
        body: DefaultAppCanvas(
          title: productList.title,
          showHeaderDivider: false,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.commonSize20,
                    ),
                    itemCount: productList.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppConstants.commonSize8,
                      crossAxisSpacing: AppConstants.commonSize8,
                    ),
                    itemBuilder: (_, index) {
                      final product = productList.products[index];

                      return AppRippleButton(
                        onTap: product.subProducts != null
                            ? () => context.push(
                                  SubProductsRoute(
                                    previousScreenTitle:
                                        context.tr.upmind_products,
                                    product: product,
                                  ),
                                )
                            : () => context.push(
                                  ConsultingDoctorRoute(
                                    previousScreenTitle:
                                        context.tr.upmind_products,
                                    productTitle: product.name,
                                  ),
                                ),
                        child: ProductCardWidget(
                          product: product,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
