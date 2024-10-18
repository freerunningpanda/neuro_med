import 'package:flutter/services.dart';

class ScreenOrientationHelper {
  ScreenOrientationHelper._();

  /// Запрет на горизонтальное вращение экрана.
  static Future<void> setPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Разрешение на любое вращение экрана.
  static Future<void> setAll() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
