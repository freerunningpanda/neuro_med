import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:upmind_front_client/features/splash_screen/presentation/cubit/splash_screen_cubit.dart';

@RoutePage()

/// Экран загрузки.
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        body: Stack(
          children: [
            BlocBuilder<SplashScreenCubit, SplashScreenState>(
              builder: (_, state) => Image.asset(
                state.imagePath,
                fit: BoxFit.cover,
                width: AppConstants.infinity,
                height: AppConstants.infinity,
              ),
            ),
            Container(
              height: AppConstants.infinity,
              width: AppConstants.infinity,
              color: context.theme.canvasColor,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.logo.logo.path),
                  AppConstants.sizedBoxH12,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: context.tr.splash_descr,
                      style: context.theme.primaryTextTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocListener<AuthBloc, AuthState>(
        listener: (_, state) => state.maybeWhen(
          orElse: () => Future.delayed(
            const Duration(seconds: 3),
            () => context.mounted
                ? context.replace(
                    const MainTabRoute(),
                  )
                : null,
          ),
        ),
        child: this,
      );
}
