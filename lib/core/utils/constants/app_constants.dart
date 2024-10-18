import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  // Common sizes.
  static const double commonSize0 = 0;
  static const double commonSize2 = 2;
  static const double commonSize4 = 4;
  static const double commonSize6 = 6;
  static const double commonSize8 = 8;
  static const double commonSize10 = 10;
  static const double commonSize12 = 12;
  static const double commonSize14 = 14;
  static const double commonSize16 = 16;
  static const double commonSize18 = 18;
  static const double commonSize20 = 20;
  static const double commonSize24 = 24;
  static const double commonSize26 = 26;
  static const double commonSize28 = 28;
  static const double commonSize32 = 32;
  static const double commonSize34 = 34;
  static const double commonSize46 = 46;
  static const double infinity = double.infinity;

  // Common spaces.
  static const sizedBoxW2 = SizedBox(width: 2);
  static const sizedBoxW4 = SizedBox(width: 4);
  static const sizedBoxW8 = SizedBox(width: 8);
  static const sizedBoxW10 = SizedBox(width: 10);
  static const sizedBoxW12 = SizedBox(width: 12);
  static const sizedBoxW16 = SizedBox(width: 16);
  static const sizedBoxW24 = SizedBox(width: 24);
  static const sizedBoxH2 = SizedBox(height: 2);
  static const sizedBoxH4 = SizedBox(height: 4);
  static const sizedBoxH6 = SizedBox(height: 6);
  static const sizedBoxH8 = SizedBox(height: 8);
  static const sizedBoxH10 = SizedBox(height: 10);
  static const sizedBoxH12 = SizedBox(height: 12);
  static const sizedBoxH14 = SizedBox(height: 14);
  static const sizedBoxH16 = SizedBox(height: 16);
  static const sizedBoxH22 = SizedBox(height: 22);
  static const sizedBoxH24 = SizedBox(height: 24);
  static const sizedBoxH26 = SizedBox(height: 26);
  static const sizedBoxH28 = SizedBox(height: 28);
  static const sizedBoxH32 = SizedBox(height: 32);
  static const sizedBoxH36 = SizedBox(height: 36);
  static const sizedBoxH48 = SizedBox(height: 48);
  static const sizedBoxH60 = SizedBox(height: 60);

  // Typography consts.
  static const double h1Headline = 26;
  static const double h2Title = 21;
  static const double body = 16;
  static const double footnote = 15;
  static const double caption = 12;

  // Border radius.
  static const double commonRadius4 = 4;
  static const double commonRadius6 = 6;
  static const double canvasRadius = 14;

  // Text field names.
  static const String authLogin = 'auth_login';
  static const String authPassword = 'auth_password';
  static const String checkPassword = 'check_password';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String message = 'message';

  // Button sizes.
  static const double buttonWidth = 273;
  static const double buttonHeight = 40;

  // Gradient properties.
  static const List<double> btnGradientStops = [0, 0.9, 1];
  static const List<double> counterGradientStops = [0.4, 0.9, 1];
  static final List<Color> btnGradientColors = [
    const Color(0xFFD86568),
    const Color(0xFFD86568).withOpacity(0.6175),
    const Color(0xFFD86568).withOpacity(0.5),
  ];

  // Header sizes.
  static const double headerHeight = 54;
  static const double categoryHeaderWidth = 206;

  // Text field sizes.
  static const double messageFieldHeight = 100;

  // Card sizes.
  static const double cardHeight = 169;
  static const double cardWidth = 160;

  // Image sizes.
  static const double userProgramImageSize = 76;
  static const double subProgramImageSize = 48;
  static const double areaItemImageHeight = 82;

  // Bottom widget sizes.
  static const double bottomWidgetHeight = 70;
  static const double bottomWidgetWidth = 160;
}
