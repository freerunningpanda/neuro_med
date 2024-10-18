// ignore_for_file: unused_field

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:upmind_front_client/core/network/fixtures/fixture_reader.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/remote/user_notifications_remote_datasource.dart';
import 'package:upmind_front_client/features/user_notifications/data/models/user_notification_model.dart';

class UserNotificationsRemoteDatasourceImpl
    implements UserNotificationsRemoteDatasource {
  UserNotificationsRemoteDatasourceImpl(
    this._dio,
    this._talker,
  );

  final Dio _dio;
  final Talker _talker;

  @override
  Future<IList<UserNotificationModel>> getUserNotifications() async {
    // Загружаем фиктивные данные из файла
    final response = await fixture('user_notifications.json');

    // Парсим JSON
    final data = jsonDecode(response) as Map<String, dynamic>;

    // Извлекаем список программ пользователя
    final userNotificationsRaw = data['user_notifications'] as List<dynamic>;

    // Преобразуем данные в модель AreaModel
    final userNotifications = userNotificationsRaw
        .map(
          (json) => UserNotificationModel.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toIList();

    // Возвращаем данные в виде IList
    return userNotifications;
  }
}
