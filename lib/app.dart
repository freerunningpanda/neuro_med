import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/connection_checker/connection_checker_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/router_cubit/router_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_theme.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:upmind_front_client/features/splash_screen/presentation/cubit/splash_screen_cubit.dart';
import 'package:upmind_front_client/generated/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.talker,
    required this.router,
    required this.theme,
    super.key,
  });

  final Talker talker;
  final AppRouter router;
  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    // Установка цвета статус-бара.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.theme.colorScheme.onPrimary,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ConnectionCheckerCubit>(),
        ),
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(
          create: (_) => sl<SplashScreenCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<RouterCubit>(),
        ),
      ],
      child: MaterialApp.router(
        locale: const Locale('ru', 'RU'),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: router.config(
          navigatorObservers: () => [
            HeroController(),
            TalkerRouteObserver(talker),
          ],
        ),
        theme: theme.lightTheme,
      ),
    );
  }
}
