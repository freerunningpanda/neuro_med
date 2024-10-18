import 'package:auto_route/auto_route.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/router/routers/auth_routes.dart';
import 'package:upmind_front_client/core/common/presentation/router/routers/main_routes.dart';
import 'package:upmind_front_client/core/common/presentation/router/routers/splash_routes.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({
    required this.splashRouters,
    required this.mainRouters,
    required this.authRouters,
  });

  final SplashRouters splashRouters;
  final MainRouters mainRouters;
  final AuthRouters authRouters;

  @override
  List<AutoRoute> get routes => [
        splashRouters.routers,
        AutoRoute(
          path: '/navigation',
          page: NavigationRoute.page,
          children: [
            mainRouters.routers,
            authRouters.routers,
          ],
        ),
      ];
}
