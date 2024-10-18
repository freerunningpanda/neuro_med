import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_switcher_state.dart';

class NotificationsSwitcherCubit extends Cubit<NotificationsSwitcherState> {
  NotificationsSwitcherCubit()
      : super(
          const NotificationsSwitcherState(
            isPushNotificationsEnabled: false,
            isEmailNotificationsEnabled: false,
          ),
        );

  void setPushNotifications({required bool isActive}) {
    isActive = !isActive;
    emit(state.copyWith(isPushNotificationsEnabled: isActive));
  }

  void setEmailNotifications({required bool isActive}) {
    isActive = !isActive;
    emit(state.copyWith(isEmailNotificationsEnabled: isActive));
  }
}
