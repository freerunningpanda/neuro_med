import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/user_notifications/data/models/user_notification_model.dart';

abstract interface class UserNotificationsLocalDatasource {
  Future<IList<UserNotificationModel>> getUserNotifications();
  Future<void> cacheUserNotification(UserNotificationModel userNotification);
}
