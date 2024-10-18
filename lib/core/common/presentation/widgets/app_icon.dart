import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

/// Иконка приложения.
class AppIcon extends StatelessWidget {
  const AppIcon(this.icon, {super.key});

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: AppConstants.commonSize20,
    );
  }
}
