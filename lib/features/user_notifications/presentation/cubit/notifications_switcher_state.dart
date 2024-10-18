part of 'notifications_switcher_cubit.dart';

class NotificationsSwitcherState extends Equatable {
  const NotificationsSwitcherState({
    required this.isPushNotificationsEnabled,
    required this.isEmailNotificationsEnabled,
  });

  final bool isPushNotificationsEnabled;
  final bool isEmailNotificationsEnabled;

  @override
  List<Object> get props =>
      [isPushNotificationsEnabled, isEmailNotificationsEnabled];

  NotificationsSwitcherState copyWith({
    bool? isPushNotificationsEnabled,
    bool? isEmailNotificationsEnabled,
  }) {
    return NotificationsSwitcherState(
      isPushNotificationsEnabled:
          isPushNotificationsEnabled ?? this.isPushNotificationsEnabled,
      isEmailNotificationsEnabled:
          isEmailNotificationsEnabled ?? this.isEmailNotificationsEnabled,
    );
  }
}
