// ignore_for_file: avoid_dynamic_calls

part of '../../core.dart';

/// Базовый класс для всех исключений, которые могут возникнуть в приложении.
class BaseException extends DioException implements Exception {
  BaseException(
    RequestOptions requestOptions,
    Response<dynamic>? response,
    this.errMessage,
  ) : super(
          requestOptions: requestOptions,
          response: response,
        );
  String errMessage;

  @override
  // ignore: no_runtimetype_tostring
  String toString() => '$runtimeType $message\n$stackTrace';

  @override
  StackTrace get stackTrace => StackTrace.fromString(
        'path: ${requestOptions.path}\n'
        'headers: ${requestOptions.headers},\n'
        'queryParameters: ${requestOptions.queryParameters},\n'
        'data: ${requestOptions.data},\n'
        'response: ${response?.data}',
      );
}

class BadRequest extends BaseException {
  BadRequest(super.requestOptions, super.response, super.errMessage);
}

class Unauthorized extends BaseException {
  Unauthorized(super.requestOptions, super.response, super.errMessage);
}

class ServerUnavailable extends BaseException {
  ServerUnavailable(super.requestOptions, super.response, super.errMessage);
}

class ServerTemporarilyUnavailable extends BaseException {
  ServerTemporarilyUnavailable(
    super.requestOptions,
    super.response,
    super.errMessage,
  );
}

class NoInternetConnection extends BaseException {
  NoInternetConnection(super.requestOptions, super.response, super.errMessage);
}

class Duplicate extends BaseException {
  Duplicate(super.requestOptions, super.response, super.errMessage);
}

class Timeout extends BaseException {
  Timeout(super.requestOptions, super.response, super.errMessage);
}

class TooManyRequests extends BaseException {
  TooManyRequests(super.requestOptions, super.response, super.errMessage);

  String? get retryAfter => response?.headers.value('retry-after');
}

class UnprocessableEntity extends BaseException {
  UnprocessableEntity(super.requestOptions, super.response, super.message);
}

class NotAcceptable extends BaseException {
  NotAcceptable(super.requestOptions, super.response, super.message);

  @override
  String get message => response?.data['message'] as String;
}

class NotFound extends BaseException {
  NotFound(super.requestOptions, super.response, super.errMessage);
}

class UnknownError extends BaseException {
  UnknownError(super.requestOptions, super.response, super.message);
}

class SharedPreferenceException implements Exception {
  const SharedPreferenceException({this.error, this.trace});
  final Object? error;
  final StackTrace? trace;
}

class SecureStorageException implements Exception {
  const SecureStorageException({this.error, this.trace});
  final Object? error;
  final StackTrace? trace;
}

class DriftDatabaseException implements Exception {
  const DriftDatabaseException(this.error, this.trace);

  final Object? error;
  final StackTrace? trace;
}
