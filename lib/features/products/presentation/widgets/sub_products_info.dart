import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/product.dart';

class SubProductsInfo extends StatelessWidget {
  const SubProductsInfo({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      padding: const EdgeInsets.only(
        left: AppConstants.commonSize12,
        top: AppConstants.commonSize2,
        right: AppConstants.commonSize12,
        bottom: AppConstants.commonSize2,
      ),
      decoration: BoxDecoration(
        color: theme.dividerTheme.color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.commonSize8),
          bottomRight: Radius.circular(AppConstants.commonSize8),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              context.tr.nSubProducts(product.subProducts?.length ?? 0),
              style: theme.primaryTextTheme.displayLarge,
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: AppConstants.commonSize20,
            color: theme.primaryTextTheme.displayLarge?.color,
          ),
        ],
      ),
    );
  }
}
