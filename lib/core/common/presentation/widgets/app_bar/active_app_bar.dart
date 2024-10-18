import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/core/utils/helpers/app_router_helper.dart';

/// AppBar приложения с элементами управления.
class ActiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActiveAppBar({
    required this.screenTitle,
    this.trailing,
    this.isAuthScreen = false,
    this.onTap,
    super.key,
  });

  final String screenTitle;
  final Widget? trailing;
  final bool isAuthScreen;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          left: AppConstants.commonSize24,
          right: AppConstants.commonSize20,
        ),
        color: context.theme.colorScheme.primary,
        height: preferredSize.height,
        child: Row(
          children: [
            AppRippleButton(
              onTap: onTap ??
                  () => AppRouterHelper.instance.popRoute(
                        context,
                        isAuthScreen: isAuthScreen,
                      ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppConstants.commonSize12,
                  right: AppConstants.commonSize8,
                  bottom: AppConstants.commonSize12,
                ),
                child: SvgGenImage(Assets.icons.appBar.arrowOne.path).svg(),
              ),
            ),
            Text(
              screenTitle,
              style: context.theme.primaryTextTheme.headlineSmall,
            ),
            const Spacer(),
            trailing ?? const SizedBox(),
          ],
        ),
      );

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight - AppConstants.commonSize12);
}
