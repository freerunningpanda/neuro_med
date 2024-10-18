import 'package:upmind_front_client/features/user_notifications/domain/entities/user_notification.dart';

class UserNotificationModel extends UserNotification {
  const UserNotificationModel({
    required this.id,
    required super.title,
    required super.body,
    required super.date,
  });

  factory UserNotificationModel.fromJson(Map<String, dynamic> json) {
    return UserNotificationModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      date: json['date'] as String,
    );
  }

  final int id;
}
