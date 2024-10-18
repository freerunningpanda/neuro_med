import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:upmind_front_client/app.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_theme.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/helpers/screen_orientation_helper.dart';
import 'package:upmind_front_client/environment/environment.dart';

void main() async {
  await runZonedGuarded(() async {
    /// Установка окружения приложения.
    AppEnvironment.setupEnv(Environment.production);

    /// Инициализация Flutter.
    /// Проверка на инициализацию FlutterBinding.
    WidgetsFlutterBinding.ensureInitialized();

    /// Инициализация SQLCipher.
    open.overrideFor(OperatingSystem.android, openCipherOnAndroid);

    /// Инициализация зависимостей.
    await dependencyInjectionsInit();

    /// Инициализация [TalkerBlocObserver] для логирования событий и состояний.
    Bloc.observer = sl<TalkerBlocObserver>();

    /// Запрет на горизонтальное вращение экрана.
    await ScreenOrientationHelper.setPortrait();

    sl<IAppLogger>().log(
      level: LogLevel.verbose,
      message: 'Application started',
    );

    /// Запуск приложения.
    runApp(
      App(
        talker: sl<Talker>(),
        router: sl<AppRouter>(),
        theme: sl<AppTheme>(),
      ),
    );
  },

      /// Обработка ошибок.
      (error, stack) {
    sl<IAppLogger>().handle(error, stack);
  });
}
