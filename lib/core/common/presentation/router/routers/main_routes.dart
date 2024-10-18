import 'package:auto_route/auto_route.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/router/base_route.dart';

@RoutePage()
class MainTabScreen extends AutoRouter {
  const MainTabScreen({super.key});
}

/// Класс роутера для модуля Main (Главная).
class MainRouters implements BaseRouters {
  @override
  AutoRoute get routers => AutoRoute(
        path: 'main_tab',
        page: MainTabRoute.page,
        children: [
          AutoRoute(
            path: 'main_screen',
            page: MainRoute.page,
            initial: true,
          ),
          AutoRoute(
            path: 'settings_screen',
            page: SettingsRoute.page,
          ),
          AutoRoute(
            path: 'notifications_screen',
            page: NotificationsRoute.page,
          ),
          AutoRoute(
            path: 'user_notification_screen',
            page: UserNotificationDetailsRoute.page,
          ),
          AutoRoute(
            path: 'product_list_screen',
            page: ProductListRoute.page,
          ),
          AutoRoute(
            path: 'user_product_detail_screen',
            page: UserProductDetailRoute.page,
          ),
          AutoRoute(
            path: 'consulting_doctor_screen',
            page: ConsultingDoctorRoute.page,
          ),
          AutoRoute(
            path: 'cosulting_doctor_form_screen',
            page: ConsultingDoctorFormRoute.page,
          ),
          AutoRoute(
            path: 'my_products_screen',
            page: MyProductsRoute.page,
          ),
          AutoRoute(
            path: 'sub_products_screen',
            page: SubProductsRoute.page,
          ),
          AutoRoute(
            path: 'areas_screen',
            page: AreasRoute.page,
          ),
        ],
      );
}
