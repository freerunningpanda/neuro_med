import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/core/utils/params/localization_params.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';

class _StatusColors {
  _StatusColors._();

  static Color inProgress = const Color(0xFFFFF9E4);
  static Color newLessons = const Color(0xFFD4FFFC);
  static Color done = const Color(0xFFD4FFDE);
}

enum Status {
  inProgress,
  newLesson,
  done,
  unknown;

  String getStatus(
    BuildContext context,
  ) =>
      switch (this) {
        inProgress => context.tr.inProgress,
        newLesson => context.tr.newLesson,
        done => context.tr.done,
        _ => context.tr.unknown,
      };

  Color getColor() => switch (this) {
        inProgress => _StatusColors.inProgress,
        newLesson => _StatusColors.newLessons,
        done => _StatusColors.done,
        _ => _StatusColors.inProgress,
      };

  String getNavigateIconPath() => switch (this) {
        done => Assets.icons.common.detailsDisabled.path,
        _ => Assets.icons.common.details.path,
      };

  Icon? getIcon(ThemeData theme) => switch (this) {
        done => Icon(
            Icons.check_circle,
            color: theme.colorScheme.primary,
          ),
        inProgress => Icon(
            Icons.circle_outlined,
            color: theme.colorScheme.onInverseSurface,
          ),
        _ => null,
      };

  Color getItemColor(ThemeData theme) => switch (this) {
        inProgress => theme.colorScheme.inversePrimary,
        done => theme.colorScheme.onSecondaryContainer,
        _ => theme.colorScheme.onSecondaryContainer,
      };

  List<InlineSpan> getStatusText(
    BuildContext context, {
    required UserProduct userProduct,
  }) =>
      [
        switch (this) {
          Status.done => TextSpan(
              text: LocalizationParams(
                param1: context.tr.finished,
                param2: userProduct.endDate,
              ).getString(),
            ),
          _ => TextSpan(
              text: LocalizationParams(
                param1: context.tr.passedSessions,
                param2: userProduct.passed.toString(),
                param3: context.tr.from,
                param4: userProduct.length.toString(),
              ).getString(),
            ),
        },
      ];

  String getTooltipText(BuildContext context) => switch (this) {
        done => context.tr.sessionAlreadyViewed,
        newLesson => context.tr.sessionIsRestricted,
        _ => '',
      };

  static Status parse(String status) => switch (status) {
        'in_progress' => inProgress,
        'new' => newLesson,
        'done' => done,
        _ => unknown,
      };
}
