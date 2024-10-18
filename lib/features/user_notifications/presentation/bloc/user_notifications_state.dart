part of 'user_notifications_bloc.dart';

sealed class UserNotificationsState extends Equatable {
  const UserNotificationsState();

  @override
  List<Object?> get props => [];
}

class UserNotificationsLoading extends UserNotificationsState {
  const UserNotificationsLoading();
}

class UserNotificationsLoaded extends UserNotificationsState {
  const UserNotificationsLoaded({
    required this.notifications,
  });

  final IList<UserNotification> notifications;

  @override
  List<Object> get props => [notifications];
}

class UserNotificationsError extends UserNotificationsState {
  const UserNotificationsError({
    this.error,
  });

  final String? error;

  @override
  List<Object?> get props => [error];
}
