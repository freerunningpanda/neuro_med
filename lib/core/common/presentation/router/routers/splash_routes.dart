import 'package:auto_route/auto_route.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/router/base_route.dart';

/// Класс роутера для модуля Splash (Главная).
class SplashRouters implements BaseRouters {
  @override
  AutoRoute get routers => AutoRoute(
        path: '/',
        page: SplashRoute.page,
      );
}
