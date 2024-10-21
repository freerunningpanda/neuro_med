import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/core/utils/helpers/app_router_helper.dart';

/// Виджет заголовка для Canvas по-умолчанию.
class CanvasDefaultHeader extends StatelessWidget {
  const CanvasDefaultHeader({
    required this.title,
    required this.isAuthScreen,
    required this.hasCross,
    super.key,
  });

  final String title;
  final bool isAuthScreen;
  final bool hasCross;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        SizedBox(
          height: AppConstants.headerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppConstants.commonSize24,
                  ),
                  child: Text(
                    title,
                    style: theme.primaryTextTheme.headlineLarge?.copyWith(
                      color: theme.secondaryHeaderColor,
                    ),
                  ),
                ),
              ),
              if (hasCross)
                AppRippleButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppConstants.commonSize20,
                      horizontal: AppConstants.commonSize20,
                    ),
                    child: SvgGenImage(Assets.icons.common.cross.path).svg(),
                  ),
                  onTap: () => AppRouterHelper.popRoute(
                    context,
                    isAuthScreen: isAuthScreen,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
