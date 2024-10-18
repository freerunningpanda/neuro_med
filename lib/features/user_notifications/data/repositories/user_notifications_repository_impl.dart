import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/network/network_info.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/local/user_notifications_local_datasource.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/remote/user_notifications_remote_datasource.dart';
import 'package:upmind_front_client/features/user_notifications/data/models/user_notification_model.dart';
import 'package:upmind_front_client/features/user_notifications/domain/repositories/user_notifications_repository.dart';

class UserNotificationsRepositoryImpl extends BaseRepository
    implements UserNotificationsRepository {
  UserNotificationsRepositoryImpl(
    this._localDatasource,
    this._remoteDatasource,
    this._networkInfo, {
    required super.logger,
  });

  final UserNotificationsLocalDatasource _localDatasource;
  final UserNotificationsRemoteDatasource _remoteDatasource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, IList<UserNotificationModel>>>
      getUserNotifications() => execute(
            _getUserNotifications,
            const NotificationsDatasourceFailure(),
          );

  Future<IList<UserNotificationModel>> _getUserNotifications() async {
    final hasConnection = await _networkInfo.hasConnection;

    final IList<UserNotificationModel> userNotifications;

    if (hasConnection) {
      userNotifications = await _remoteDatasource.getUserNotifications();

      for (final notification in userNotifications) {
        await _localDatasource.cacheUserNotification(notification);
      }

      return userNotifications;
    }

    userNotifications = await _localDatasource.getUserNotifications();

    return userNotifications;
  }
}
