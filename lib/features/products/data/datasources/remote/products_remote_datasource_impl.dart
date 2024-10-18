// ignore_for_file: unused_field

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:upmind_front_client/core/network/fixtures/fixture_reader.dart';
import 'package:upmind_front_client/features/products/data/datasources/remote/products_remote_datasource.dart';
import 'package:upmind_front_client/features/products/data/models/category_model.dart';
import 'package:upmind_front_client/features/products/data/models/user_product_model.dart';

// ignore: lines_longer_than_80_chars
// TODO(freerunningpanda): Моковая реализация. Удалить после подключения к серверу.
class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  const ProductsRemoteDatasourceImpl(
    this._dio,
    this._talker,
  );

  final Dio _dio;
  final Talker _talker;

  @override
  Future<IList<CategoryModel>> getProducts() async {
    // Загружаем фиктивные данные из файла
    final response = await fixture('main_screen_products.json');

    // Парсим JSON
    final data = jsonDecode(response) as Map<String, dynamic>;

    // Извлекаем список категорий
    final categoriesData = data['categories'] as List<dynamic>;

    // Преобразуем данные в модели CategoryModel
    final categories = categoriesData
        .map(
          // ignore: avoid_dynamic_calls
          (categoryJson) => (categoryJson['category'] as List<dynamic>)
              .map((cat) => CategoryModel.fromJson(cat as Map<String, dynamic>))
              .toIList(),
        )
        .expand((element) => element) // Преобразуем в плоский список
        .toIList();

    // Возвращаем данные в виде IList
    return categories;
  }

  @override
  Future<IList<UserProductModel>> getUserProducts() async {
    // Загружаем фиктивные данные из файла
    final response = await fixture('user_products.json');

    // Парсим JSON
    final data = jsonDecode(response) as Map<String, dynamic>;

    // Извлекаем список программ пользователя
    final userProductList = data['user_products'] as List<dynamic>;

    // Преобразуем данные в модель UserProductModel
    final categories = userProductList
        .map((json) => UserProductModel.fromJson(json as Map<String, dynamic>))
        .toIList();

    // Возвращаем данные в виде IList
    return categories;
  }
}
