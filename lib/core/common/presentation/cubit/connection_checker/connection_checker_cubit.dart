import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connection_checker_state.dart';


/// Кубит для проверки подключения к интернету.
class ConnectionCheckerCubit extends Cubit<ConnectionCheckerState> {
  ConnectionCheckerCubit(this.connectionChecker)
      : super(const ConnectionCheckerState(isConnected: false)) {
    checkConnection();
  }

  final InternetConnectionChecker connectionChecker;

  /// Проверка подключения к Интернету.
  void checkConnection() {
    /// Подписка на изменение статуса подключения.
    connectionChecker.onStatusChange.listen(
      (event) => switch (event) {
        InternetConnectionStatus.connected =>
          emit(const ConnectionCheckerState(isConnected: true)),
        InternetConnectionStatus.disconnected =>
          emit(const ConnectionCheckerState(isConnected: false)),
      },
    );
  }
}
