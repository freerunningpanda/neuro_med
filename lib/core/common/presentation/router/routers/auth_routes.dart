import 'package:auto_route/auto_route.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/router/base_route.dart';
import 'package:upmind_front_client/core/common/presentation/router/routers/main_routes.dart';

@RoutePage()
class AuthTabScreen extends AutoRouter {
  const AuthTabScreen({super.key});
}

/// Класс роутера для модуля Auth (Авторизация).
class AuthRouters implements BaseRouters {
  @override
  AutoRoute get routers => AutoRoute(
        path: 'auth_tab',
        page: AuthTabRoute.page,
        children: [
          AutoRoute(
            path: 'auth_screen',
            page: AuthRoute.page,
          ),
          AutoRoute(
            path: 'forgot_password_screen',
            page: ForgotPasswordRoute.page,
          ),
          AutoRoute(
            path: 'contact_the_admin_screen',
            page: ContactTheAdminRoute.page,
          ),
          AutoRoute(
            path: 'my_products_screen',
            page: MyProductsRoute.page,
          ),
          MainRouters().routers,
        ],
      );
}
