import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/theme/typography/base_typography.dart';
import 'package:upmind_front_client/core/common/presentation/theme/typography/button_typo.dart';
import 'package:upmind_front_client/core/common/presentation/theme/typography/caption_typo.dart';
import 'package:upmind_front_client/core/common/presentation/theme/typography/description_typo.dart';
import 'package:upmind_front_client/core/common/presentation/theme/typography/heading_typo.dart';
import 'package:upmind_front_client/core/common/presentation/theme/typography/text_typo.dart';
import 'package:upmind_front_client/core/utils/gen/fonts.gen.dart';

/// Класс [AppTypo] содержит типографику приложения.
/// Все изменения в типографике производятся в этом классе.

class AppTypo extends BaseTypography {
  /// Конструктор для типографики приложения
  const AppTypo()
      : super(
          headingTypo: const _HeadingTypography(),
          textTypo: const _TextTypography(),
          captionTypo: const _CaptionTypography(),
          descriptionTypo: const _DescriptionTypography(),
          buttonTypo: const _ButtonTypography(),
        );

  @override
  ThemeExtension<BaseTypography> copyWith() => const AppTypo();

  @override
  ThemeExtension<BaseTypography> lerp(
    covariant ThemeExtension<BaseTypography>? other,
    double t,
  ) {
    if (other! is AppTypo) return this;
    return const AppTypo();
  }
}

class _HeadingTypography extends HeadingTypography {
  const _HeadingTypography()
      : super(
          h1: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.manrope,
            height: 24 / 20,
          ),
          h2: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.manrope,
            height: 23.22 / 17,
          ),
          h2Secondary: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.manrope,
            height: 15 / 13,
          ),
          h3: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.manrope,
            height: 15 / 13,
          ),
        );
}

class _TextTypography extends TextTypography {
  const _TextTypography()
      : super(
          tx1Regular: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 20.49 / 15,
            fontFamily: FontFamily.manrope,
          ),
          tx1SemiBold: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 22 / 16,
            fontFamily: FontFamily.manrope,
          ),
          tx2Regular: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 15 / 13,
            fontFamily: FontFamily.manrope,
          ),
          tx4Medium: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 14 / 11,
            fontFamily: FontFamily.manrope,
          ),
        );
}

class _CaptionTypography extends CaptionTypography {
  const _CaptionTypography()
      : super(
          c1: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.manrope,
            height: 13.66 / 10,
          ),
          c2: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.manrope,
            height: 13.66 / 10,
          ),
        );
}

class _DescriptionTypography extends DescriptionTypography {
  const _DescriptionTypography()
      : super(
          des1: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.manrope,
            height: 17.76 / 13,
          ),
        );
}

class _ButtonTypography extends ButtonTypography {
  const _ButtonTypography()
      : super(
          btn1semiBold: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.manrope,
            height: 20.49 / 15,
          ),
        );
}
