// ignore_for_file: one_member_abstracts

import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Класс для проверки подключения к интернету.
abstract class NetworkInfo {
  /// Метод [onStatusChange] возвращает [Stream] событий статуса подключения.
  Stream<InternetConnectionStatus> onStatusChange();

  /// [hasConnection] возвращает [Future] с результатом проверки подключения.
  Future<bool> get hasConnection;
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.connectionChecker);

  final InternetConnectionChecker connectionChecker;

  @override
  Stream<InternetConnectionStatus> onStatusChange() =>
      connectionChecker.onStatusChange;

  @override
  Future<bool> get hasConnection => connectionChecker.hasConnection;
}
