import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/canvas_default_header.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

/// Фон для экранов приложения.
class DefaultAppCanvas extends StatelessWidget {
  const DefaultAppCanvas({
    required this.title,
    required this.child,
    this.isAuthScreen = false,
    this.hasCross = false,
    this.showHeaderDivider = true,
    this.showBottomDivider = true,
    this.isPortrait = true,
    super.key,
  });

  final String title;
  final bool isAuthScreen;
  final Widget child;

  /// Показывать иконку закрытия в заголовке.
  final bool hasCross;

  /// Показывать разделитель в заголовке.
  final bool showHeaderDivider;

  /// Показывать разделитель внизу.
  final bool showBottomDivider;

  /// Портретная ориентация.
  final bool isPortrait;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppConstants.canvasRadius),
            topRight: Radius.circular(AppConstants.canvasRadius),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPortrait)
              CanvasDefaultHeader(
                title: title,
                isAuthScreen: isAuthScreen,
                hasCross: hasCross,
              ),
            if (showHeaderDivider) const AppDivider(),
            Expanded(
              child: child,
            ),
            if (showBottomDivider) const AppDivider(),
          ],
        ),
      );
}
