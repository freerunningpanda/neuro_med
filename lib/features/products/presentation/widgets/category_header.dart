import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    required this.productsCategory,
    required this.userRole,
    required this.index,
    super.key,
  });

  final Category productsCategory;
  final UserRole userRole;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.commonSize24,
      ),
      child: AppRippleButton(
        onTap: () => context.push(
          ProductListRoute(
            previousScreenTitle: context.tr.upmind_products,
            productList: productsCategory,
            userRole: userRole,
          ),
        ),
        child: Column(
          children: [
            if (index != 0)
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppConstants.commonSize6,
                ),
                child: AppDivider(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppConstants.categoryHeaderWidth,
                  child: Text(
                    productsCategory.title,
                    style: theme.primaryTextTheme.headlineMedium?.copyWith(),
                  ),
                ),
                Text(
                  context.tr.details,
                  style: theme.primaryTextTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
