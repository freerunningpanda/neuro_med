part of '../../data/core_data.dart';

/// Обработчик запросов.
class RequestHandler {
  RequestHandler._();

  /// Отправляет запрос и возвращает результат.
  static Future<E> sendRequest<E, R>({
    required Future<Response<Object>> Function() request,
    required FutureOr<E> Function(R) converter,
    required Talker talker,
    bool useCompute = false,
  }) async {
    final Response<dynamic> response = await request();

    talker.info(response);
    final result = useCompute
        ? compute<R, E>(converter, response.data as R)
        : await converter(response.data as R);
    return result as E;
  }
}
