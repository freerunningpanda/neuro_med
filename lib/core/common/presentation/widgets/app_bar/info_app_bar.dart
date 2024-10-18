import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

/// AppBar приложения с элементами управления.
class InfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InfoAppBar({
    required this.title,
    this.trailing,
    super.key,
  });

  final String title;
  final Widget? trailing;

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
            Text(
              title,
              style: context.theme.primaryTextTheme.headlineLarge,
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
