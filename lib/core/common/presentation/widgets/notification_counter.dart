import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

/// Счетчик уведомлений.
class NotificationCounter extends StatelessWidget {
  const NotificationCounter({
    required this.counter,
    super.key,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      width: AppConstants.commonSize14,
      height: AppConstants.commonSize14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          stops: AppConstants.counterGradientStops,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppConstants.btnGradientColors,
        ),
      ),
      child: Center(
        child: Text(
          counter.toString(),
          style: theme.primaryTextTheme.displaySmall,
        ),
      ),
    );
  }
}
