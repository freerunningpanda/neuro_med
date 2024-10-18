part of '../../data/core_data.dart';

class AppInterceptor extends InterceptorsWrapper {
  AppInterceptor({required this.logger});

  final IAppLogger logger;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection) {
      super.onRequest(options, handler);
    } else {
      handler.reject(
        NoInternetConnection(
          options,
          null,
          'No internet connection',
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      logger.handle(err.response!);
    }

    const errMessage = 'Just Error';

    switch (err.response?.statusCode) {
      case 400:
        super.onError(
          BadRequest(err.requestOptions, err.response, errMessage),
          handler,
        );
      case 401:
        super.onError(
          Unauthorized(err.requestOptions, err.response, errMessage),
          handler,
        );

      case 403:
        super.onError(
          Unauthorized(err.requestOptions, err.response, errMessage),
          handler,
        );
      case 404:
        super.onError(
          NotFound(err.requestOptions, err.response, errMessage),
          handler,
        );
      case 406:
        super.onError(
          NotAcceptable(err.requestOptions, err.response, errMessage),
          handler,
        );
      case 429:
        super.onError(
          TooManyRequests(err.requestOptions, err.response, errMessage),
          handler,
        );
      case 422:
        super.onError(
          UnprocessableEntity(err.requestOptions, err.response, errMessage),
          handler,
        );
      // case 500:
      case 500:
        super.onError(
          ServerUnavailable(err.requestOptions, err.response, errMessage),
          handler,
        );
      case 503:
        super.onError(
          ServerTemporarilyUnavailable(
            err.requestOptions,
            err.response,
            errMessage,
          ),
          handler,
        );
      default:
        super.onError(
          UnknownError(err.requestOptions, err.response, errMessage),
          handler,
        );
        break;
    }
  }
}
