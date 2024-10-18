import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/local/user_notifications_local_datasource.dart';
import 'package:upmind_front_client/features/user_notifications/data/mappers/user_notifications_mapper.dart';
import 'package:upmind_front_client/features/user_notifications/data/models/user_notification_model.dart';

class UserNotificationsLocalDatasourceImpl
    implements UserNotificationsLocalDatasource {
  UserNotificationsLocalDatasourceImpl(this._drift);

  final DriftDatabaseImpl _drift;

  @override
  Future<IList<UserNotificationModel>> getUserNotifications() async {
    try {
      final entities =
          await _drift.select(_drift.userNotificationEntities).get();

      final areaList = entities.map((obj) => obj.fromDrift()).toIList();

      return areaList;
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }

  @override
  Future<void> cacheUserNotification(
    UserNotificationModel userNotification,
  ) async {
    try {
      final existingNotifications =
          await (_drift.select(_drift.userNotificationEntities)
                ..where((tbl) => tbl.id.equals(userNotification.id)))
              .getSingleOrNull();

      if (existingNotifications != null) {
        await (_drift.update(_drift.userNotificationEntities)
              ..where((tbl) => tbl.id.equals(userNotification.id)))
            .write(
          userNotification.toDrift(),
        );

        return;
      }

      await _drift.into(_drift.userNotificationEntities).insert(
            userNotification.toDrift(),
          );
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }
}
