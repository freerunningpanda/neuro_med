import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/canvas_custom_header.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

/// Кастомный фон для экранов приложения.
class CustomAppCanvas extends StatelessWidget {
  const CustomAppCanvas({
    required this.child,
    this.content,
    this.hasLowerDivider = true,
    super.key,
  });

  final Widget child;
  final Widget? content;
  final bool hasLowerDivider;

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
            CanvasCustomHeader(
              widget: content ?? const SizedBox.shrink(),
            ),
            const AppDivider(),
            Expanded(
              child: child,
            ),
            if (hasLowerDivider) const AppDivider(),
          ],
        ),
      );
}
