part of 'user_notifications_bloc.dart';

sealed class UserNotificationsEvent {
  const UserNotificationsEvent();
}

class LoadUserNotifications extends UserNotificationsEvent {
  const LoadUserNotifications();
}
