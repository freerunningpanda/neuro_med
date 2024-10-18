import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/user_notifications/domain/entities/user_notification.dart';
import 'package:upmind_front_client/features/user_notifications/domain/usecases/get_user_notifications.dart';

part 'user_notifications_event.dart';
part 'user_notifications_state.dart';

typedef _Emit = Emitter<UserNotificationsState>;

class UserNotificationsBloc
    extends Bloc<UserNotificationsEvent, UserNotificationsState> {
  UserNotificationsBloc(this.getUserNotifications)
      : super(const UserNotificationsLoading()) {
    on<LoadUserNotifications>(_onGetNotifications);

    add(const LoadUserNotifications());
  }

  final GetUserNotifications getUserNotifications;

  Future<void> _onGetNotifications(
    LoadUserNotifications event,
    _Emit emit,
  ) async {
    emit(const UserNotificationsLoading());
    final notifications = await getUserNotifications.call(NoParams());

    notifications.fold(
      (failure) => emit(UserNotificationsError(error: failure.error ?? '')),
      (notifications) => emit(
        UserNotificationsLoaded(notifications: notifications),
      ),
    );
  }
}
