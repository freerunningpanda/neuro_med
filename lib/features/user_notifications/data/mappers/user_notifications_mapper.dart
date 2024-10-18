import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/features/user_notifications/data/models/user_notification_model.dart';
import 'package:upmind_front_client/features/user_notifications/domain/entities/user_notification.dart';

extension UserNotificationsFromModel on UserNotificationModel {
  UserNotification toEntity() => UserNotification(
        title: title,
        body: body,
        date: date,
      );
}

extension UserNotificationsFromDrift on UserNotificationEntity {
  UserNotificationModel fromDrift() => UserNotificationModel(
        id: id,
        title: title,
        body: body,
        date: date,
      );
}

extension UserNotificationsToDrift on UserNotificationModel {
  UserNotificationEntity toDrift() => UserNotificationEntity(
        id: id,
        title: title,
        body: body,
        date: date,
      );
}
