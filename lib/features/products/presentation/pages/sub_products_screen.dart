import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_all_buttons.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/products/domain/entities/product.dart';
import 'package:upmind_front_client/features/products/domain/entities/sub_products.dart';

@RoutePage()
class SubProductsScreen extends StatelessWidget {
  const SubProductsScreen({
    required this.previousScreenTitle,
    required this.product,
    super.key,
  });

  final String previousScreenTitle;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppScaffold(
      appBar: ActiveAppBar(
        screenTitle: previousScreenTitle,
        trailing: AppAllButtons(
          previousScreenTitle: product.name,
        ),
      ),
      body: DefaultAppCanvas(
        hasCross: true,
        title: product.name,
        child: ListView.builder(
          itemCount: product.subProducts?.length,
          itemBuilder: (_, index) {
            final subProduct = product.subProducts?[index];
            return _SubProductsContent(
              previousScreenTitle: previousScreenTitle,
              subProduct: subProduct,
              theme: theme,
              product: product,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class _SubProductsContent extends StatelessWidget {
  const _SubProductsContent({
    required this.previousScreenTitle,
    required this.subProduct,
    required this.theme,
    required this.product,
    required this.index,
  });

  final String previousScreenTitle;
  final SubProducts? subProduct;
  final ThemeData theme;
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AppRippleButton(
            onTap: () => context.push(
              ConsultingDoctorRoute(
                previousScreenTitle: previousScreenTitle,
                productTitle: subProduct?.name ?? '',
              ),
            ),
            child: ListTile(
              leading: Image.network(
                fit: BoxFit.cover,
                width: AppConstants.subProgramImageSize,
                height: AppConstants.subProgramImageSize,
                subProduct?.thumbnail ?? '',
              ),
              title: Text(
                subProduct?.name ?? '',
                style: theme.primaryTextTheme.titleLarge,
              ),
              trailing: SvgGenImage(Assets.icons.common.details.path).svg(),
            ),
          ),
          if (index != product.subProducts!.length - 1)
            Container(
              height: AppConstants.commonSize4,
              color: theme.dividerTheme.color,
            ),
          if (index == product.subProducts!.length - 1) const AppDivider(),
        ],
      );
}
