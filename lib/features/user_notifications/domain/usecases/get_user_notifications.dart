import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/user_notifications/domain/entities/user_notification.dart';
import 'package:upmind_front_client/features/user_notifications/domain/repositories/user_notifications_repository.dart';

class GetUserNotifications extends UseCase<IList<UserNotification>, NoParams> {
  GetUserNotifications(this._repository);

  final UserNotificationsRepository _repository;

  @override
  Future<Either<Failure, IList<UserNotification>>> call(NoParams params) =>
      _repository.getUserNotifications();
}
