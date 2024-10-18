import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_typo.dart';
import 'package:upmind_front_client/core/common/presentation/theme/colors/base_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/decorations/custom_outline_input_border.dart';
import 'package:upmind_front_client/core/common/presentation/theme/typography/base_typography.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/extensions/text_style_ext.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';

/// Класс [AppTheme] содержит основную тему приложения, которая объединяет в
/// себе цветовую тему и типографику. Все изменения в теме приложения
/// производятся в этом классе.

class AppTheme {
  AppTheme({
    required AppColors colors,
    required AppTypo typography,
  })  : _appColors = colors,
        _appTypo = typography;

  final AppColors _appColors;
  final AppTypo _appTypo;

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      extensions: <ThemeExtension>[_appColors, _appTypo],
      scaffoldBackgroundColor: _appColors.mainColors.white,
      bottomAppBarTheme: _bottomAppBarTheme(),
      colorScheme: _colorScheme(colors: _appColors),
      dividerTheme: _dividerTheme(),
      brightness: Brightness.light,
      hoverColor: _appColors.otherColors.transparent,
      splashColor: _appColors.mainColors.accent.withOpacity(0.4),
      canvasColor: _appColors.mainColors.bg70,
      highlightColor: _appColors.otherColors.transparent,
      appBarTheme: _appBarTheme(colors: _appColors, typography: _appTypo),
      indicatorColor: _appColors.textColors.error,
      secondaryHeaderColor: _appColors.textColors.main,
      disabledColor: _appColors.textColors.secondary,
      primaryTextTheme: _primaryTextTheme(
        _appTypo,
        _appColors,
      ),
      bottomNavigationBarTheme: _bottomNavBarTheme(
        colors: _appColors,
        typography: _appTypo,
      ),
      inputDecorationTheme: _inputDecorationTheme(
        colors: _appColors,
        typography: _appTypo,
      ),
      actionIconTheme: _actionIconTheme(),
      iconTheme: _iconTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(_appColors),
      dialogTheme: _dialogTheme(),
    );
  }

  DialogTheme _dialogTheme() {
    return DialogTheme(
      barrierColor: _appColors.mainColors.bg70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppConstants.commonRadius6,
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData _bottomNavBarTheme({
    required BaseColors colors,
    required BaseTypography typography,
  }) =>
      BottomNavigationBarThemeData(
        backgroundColor: colors.mainColors.primary,
        selectedItemColor: colors.textColors.white,
        unselectedItemColor: colors.textColors.white.withOpacity(0.6),
        selectedLabelStyle: typography.textTypo.tx4Medium,
        unselectedLabelStyle: typography.textTypo.tx4Medium,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
      );

  static InputDecorationTheme _inputDecorationTheme({
    required BaseColors colors,
    required BaseTypography typography,
  }) =>
      InputDecorationTheme(
        filled: true,
        fillColor: colors.otherColors.separator,
        border: InputBorder.none,
        enabledBorder: _buildBorder(colors.otherColors.transparent),
        focusedBorder: _buildBorder(colors.fieldBordersColors.accent),
        errorBorder: _buildBorder(colors.fieldBordersColors.negative),
        focusedErrorBorder: _buildBorder(colors.fieldBordersColors.negative),
        disabledBorder: _buildBorder(colors.fieldBordersColors.inactive),
        labelStyle: typography.descriptionTypo.des1
            .withColor(colors.textColors.secondary),
        floatingLabelStyle: typography.descriptionTypo.des1
            .withColor(colors.textColors.secondary),
      );

  static CustomOutlineInputBorder _buildBorder(Color color) =>
      CustomOutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppConstants.commonRadius6,
        ),
        borderSide: BorderSide(color: color),
      );

  static ColorScheme _colorScheme({
    required BaseColors colors,
  }) =>
      ColorScheme(
        brightness: Brightness.light,
        primary: colors.mainColors.primary,
        onPrimary: colors.mainColors.white,
        secondary: colors.mainColors.primary,
        onSecondary: colors.mainColors.accent,
        error: colors.textColors.error,
        onError: colors.textColors.error,
        surface: colors.mainColors.white,
        onSurface: colors.textColors.accent,
        onPrimaryContainer: colors.otherColors.transparent,
        inversePrimary: colors.textColors.main,
        inverseSurface: colors.textColors.secondary,
        onTertiary: colors.otherColors.gray,
        onInverseSurface: colors.textColors.red,
        onSecondaryContainer: colors.otherColors.gray2,
        onTertiaryFixed: colors.infoColors.gray,
      );

  static TextTheme _primaryTextTheme(
    BaseTypography typography,
    BaseColors colors,
  ) =>
      TextTheme(
        headlineLarge: typography.headingTypo.h1,
        headlineMedium: typography.headingTypo.h2.copyWith(
          color: colors.textColors.main,
        ),
        headlineSmall: typography.textTypo.tx1Regular,
        labelLarge: typography.buttonTypo.btn1semiBold.copyWith(
          color: colors.textColors.red,
        ),
        labelMedium: typography.descriptionTypo.des1.copyWith(
          color: colors.textColors.main,
        ),
        labelSmall: typography.captionTypo.c1.copyWith(
          color: colors.textColors.main,
        ),
        bodyLarge: typography.buttonTypo.btn1semiBold.copyWith(
          color: colors.textColors.white,
        ),
        bodyMedium: typography.textTypo.tx1Regular.copyWith(
          color: colors.textColors.accent,
        ),
        bodySmall: typography.textTypo.tx2Regular.copyWith(
          color: colors.mainColors.accent,
        ),
        titleMedium: typography.textTypo.tx1Regular.copyWith(
          color: colors.textColors.main,
        ),
        displaySmall: typography.captionTypo.c1.copyWith(
          color: colors.textColors.white,
        ),
        titleSmall: typography.captionTypo.c2.copyWith(
          color: colors.textColors.secondary,
        ),
        displayMedium: typography.headingTypo.h3.copyWith(
          color: colors.textColors.main,
        ),
        displayLarge: typography.headingTypo.h2Secondary.copyWith(
          color: colors.textColors.red,
        ),
        titleLarge: typography.headingTypo.h3.copyWith(
          color: colors.mainColors.accent,
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonTheme(BaseColors colors) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          overlayColor: colors.textColors.error,
          shadowColor: colors.otherColors.transparent,
          backgroundColor: colors.otherColors.transparent,
          elevation: 0,
          fixedSize: const Size(
            AppConstants.buttonWidth,
            AppConstants.buttonHeight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.commonRadius6,
            ),
          ),
        ),
      );

  DividerThemeData _dividerTheme() => DividerThemeData(
        color: _appColors.otherColors.separator,
        thickness: AppConstants.commonSize4,
      );

  static AppBarTheme _appBarTheme({
    required BaseColors colors,
    required BaseTypography typography,
  }) =>
      AppBarTheme(
        backgroundColor: colors.mainColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: typography.textTypo.tx1SemiBold.withColor(
          colors.textColors.main,
        ),
      );

  BottomAppBarTheme _bottomAppBarTheme() => BottomAppBarTheme(
        color: _appColors.mainColors.primary,
      );

  IconThemeData _iconTheme() => IconThemeData(
        color: _appColors.mainColors.white,
        size: AppConstants.commonSize16,
      );

  ActionIconThemeData _actionIconTheme() => ActionIconThemeData(
        backButtonIconBuilder: (_) => Assets.icons.appBar.arrowOne.svg(),
      );
}
