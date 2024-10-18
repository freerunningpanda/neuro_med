import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/user_notifications/domain/entities/user_notification.dart';

abstract interface class UserNotificationsRepository {
  Future<Either<Failure, IList<UserNotification>>> getUserNotifications();
}
