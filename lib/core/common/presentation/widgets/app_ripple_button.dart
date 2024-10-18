import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AppRippleButton extends StatelessWidget {
  const AppRippleButton({
    required this.child,
    required this.onTap,
    super.key,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
  });

  final Widget child;
  final void Function()? onTap;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          child,
          Positioned.fill(
            left: left,
            top: top,
            right: right,
            bottom: bottom,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  AppConstants.commonSize8,
                ),
                onTap: onTap,
              ),
            ),
          ),
        ],
      );
}
