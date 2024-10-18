part of '../../core.dart';

/// Класс [Failure] является базовым классом для всех ошибок, которые могут
/// возникнуть в приложении. Содержит описание ошибки (при наличии).
sealed class Failure with EquatableMixin implements Exception {
  /// Создает экземпляр [Failure].
  /// - [error] - описание ошибки.
  const Failure(this.error);

  final String? error;

  @override
  List<Object?> get props => [error];
}

// ! -------------------------------- User ------------------------------- ! //
class UserDatasourceFailure extends Failure {
  const UserDatasourceFailure([super.error]);
}

// ! -------------------------------- Auth ------------------------------- ! //
class AuthDatasourceFailure extends Failure {
  const AuthDatasourceFailure([super.error]);
}

// ! -------------------------------- SplashScreen ------------------------------- ! //
class SplashScreenDatasourceFailure extends Failure {
  const SplashScreenDatasourceFailure([super.error]);
}

// ! -------------------------------- Connection checker ------------------------------- ! //
class NoConnectionFailure extends Failure {
  NoConnectionFailure([super.error]);
}

// ! -------------------------------- Products ------------------------------- ! //
class ProductsDatasourceFailure extends Failure {
  const ProductsDatasourceFailure([super.error]);
}

// ! -------------------------------- Areas ------------------------------- ! //
class AreasDatasourceFailure extends Failure {
  const AreasDatasourceFailure([super.error]);
}

// ! -------------------------------- Notifications ------------------------------- ! //
class NotificationsDatasourceFailure extends Failure {
  const NotificationsDatasourceFailure([super.error]);
}
