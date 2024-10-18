part of '../../data/core_data.dart';

class RedirectInterceptor extends AppInterceptor {
  RedirectInterceptor(this._dio, {required super.logger});

  final Dio _dio;

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 302) {
      final location = response.headers.value('location');
      if (location != null) {
        // Преобразуем относительный путь в абсолютный URL
        // Парсим текущий URL и добавляем к нему относительный путь
        final uri = Uri.parse(location);
        // Если URL не содержит схему, то это относительный путь
        if (!uri.hasScheme) {
          // Получаем базовый URL и добавляем к нему относительный путь
          final baseUri = Uri.parse(response.requestOptions.uri.toString());
          // Объединяем базовый URL и относительный путь
          final newUri = baseUri.resolveUri(uri);
          // Отправляем GET-запрос по новому URL
          final redirectResponse = await _dio.get<dynamic>(newUri.toString());
          // Продолжаем обработку редиректа
          return handler.resolve(redirectResponse);
        } else {
          // Отправляем GET-запрос по абсолютному URL
          final redirectResponse = await _dio.get<dynamic>(location);
          // Продолжаем обработку редиректа
          return handler.resolve(redirectResponse);
        }
      }
    }
    // Продолжить обработку если не редирект
    return handler.next(response);
  }
}
