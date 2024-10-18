// ignore_for_file: overridden_fields

part of '../../data/core_data.dart';

class CookieInterceptor extends AppInterceptor {
  CookieInterceptor(this.logger, this._authRepository) : super(logger: logger);
  // ignore: unused_field
  @override
  final IAppLogger logger;
  final AuthRepository _authRepository;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authData = await _authRepository.checkAuth();
    final cookie = authData.right?.$1?.cookie;

    if (cookie != null && cookie.isNotEmpty) {
      options.headers['cookie'] = cookie;
    }
    await super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    const errMessage = 'Just Error';

    logger.handle(err.response!);

    switch (err.response?.statusCode) {
      case 401:
        super.onError(
          Unauthorized(err.requestOptions, err.response, errMessage),
          handler,
        );

      default:
        super.onError(err, handler);
    }
  }
}
