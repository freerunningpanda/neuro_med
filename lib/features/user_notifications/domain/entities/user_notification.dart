import 'package:equatable/equatable.dart';

class UserNotification extends Equatable {
  const UserNotification({
    required this.title,
    required this.body,
    required this.date,
  });

  final String title;
  final String body;
  final String date;

  @override
  List<Object?> get props => [
        title,
        body,
        date,
      ];
}
