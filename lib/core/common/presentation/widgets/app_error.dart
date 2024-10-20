import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';

/// Виджет отвечающий за отображение ошибки.
/// Ппозволяющий отправить повторный запрос.
class AppError extends StatelessWidget {
  const AppError({
    this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppConstants.commonSize18),
            child: SvgGenImage(Assets.icons.common.exclamation.path).svg(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.commonSize18,
            ),
            child: Text(
              context.tr.somethingWentWrong,
              style: theme.primaryTextTheme.headlineLarge?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ),
          Text(
            context.tr.tryAgain,
            style: theme.primaryTextTheme.bodyMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.commonSize18,
            ),
            child: AppButton(
              title: context.tr.repeat,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
