import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/base_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/field_border_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/gradient_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/info_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/main_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/other_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/text_colors.dart';

/// Класс [AppColors] содержит цветовую тему приложения.

class AppColors extends BaseColors {
  const AppColors()
      : super(
          mainColors: const _MainColors(),
          textColors: const _TextColors(),
          fieldBordersColors: const _FieldBordersColors(),
          infoColors: const _InfoColors(),
          gradientColors: const _GradientColors(),
          otherColors: const _OtherColors(),
        );

  @override
  ThemeExtension<BaseColors> copyWith() => const AppColors();

  @override
  ThemeExtension<BaseColors> lerp(
    covariant ThemeExtension<BaseColors>? other,
    double t,
  ) {
    if (other! is AppColors) return this;
    return const AppColors();
  }
}

class _MainColors extends MainColors {
  const _MainColors()
      : super(
          primary: const Color(0xFF23919E),
          accent: const Color(0xFF302E42),
          bg70: const Color.fromRGBO(35, 145, 158, 0.8),
          white: const Color(0xFFFFFFFF),
        );
}

class _TextColors extends TextColors {
  const _TextColors()
      : super(
          main: const Color(0xFF4C5456),
          accent: const Color(0xFF000000),
          error: const Color(0xFFFD060D),
          secondary: const Color(0xFF8E8D8D),
          white: const Color(0xFFFFFFFF),
          red: const Color(0xFFD86568),
        );
}

class _FieldBordersColors extends FieldBordersColors {
  const _FieldBordersColors()
      : super(
          main: const Color(0xFFC6C9CB),
          accent: const Color(0xFF23919E),
          negative: const Color(0xFFF25C68),
        );
}

class _InfoColors extends InfoColors {
  const _InfoColors()
      : super(
          gray: const Color(0xFF5F7173),
        );
}

class _GradientColors extends GradientColors {
  const _GradientColors()
      : super(
          bgGradient: const [
            Color(0xFF274886),
            Color(0xFF49AAC3),
          ],
        );
}

class _OtherColors extends OtherColors {
  const _OtherColors()
      : super(
          separator: const Color(0xFFF0F8F6),
          transparent: const Color(0x00000000),
          gray: const Color(0xFFC4C4C4),
          gray2: const Color(0xFFB8B8B8),
        );
}
