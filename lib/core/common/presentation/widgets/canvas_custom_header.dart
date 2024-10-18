import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

/// Виджет заголовка для Canvas с кастомным содержимым.
class CanvasCustomHeader extends StatelessWidget {
  const CanvasCustomHeader({
    required this.widget,
    super.key,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppConstants.headerHeight,
        child: Center(child: widget),
      );
}
