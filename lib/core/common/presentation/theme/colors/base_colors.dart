import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/field_border_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/gradient_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/info_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/main_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/other_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/text_colors.dart';

/// Цвета приложения, используемые в макетах
abstract class BaseColors extends ThemeExtension<BaseColors> {
  const BaseColors({
    required this.mainColors,
    required this.textColors,
    required this.fieldBordersColors,
    required this.infoColors,
    required this.gradientColors,
    required this.otherColors,
  });

  final MainColors mainColors;

  final TextColors textColors;

  final FieldBordersColors fieldBordersColors;

  final InfoColors infoColors;

  final GradientColors gradientColors;

  final OtherColors otherColors;
}
