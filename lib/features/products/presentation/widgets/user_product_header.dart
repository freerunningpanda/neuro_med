import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class UserProductHeader extends StatelessWidget {
  const UserProductHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.commonSize24,
      ),
      child: AppRippleButton(
        onTap: () => context.push(
          const MyProductsRoute(),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppConstants.categoryHeaderWidth,
                  child: Text(
                    context.tr.myProducts,
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
