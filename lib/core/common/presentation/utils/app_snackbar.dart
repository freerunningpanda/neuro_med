import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AppSnackbar {
  AppSnackbar._();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context, {
    required String title,
    required String message,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.theme.dividerTheme.color,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: AppConstants.commonSize2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: context.theme.primaryTextTheme.headlineMedium
                          ?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      child: Icon(
                        Icons.close,
                        size: AppConstants.commonSize20,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                message,
                style: context.theme.primaryTextTheme.bodyMedium,
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
            left: AppConstants.commonSize24,
            right: AppConstants.commonSize24,
          ),
        ),
      );
}
