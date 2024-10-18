import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/products/data/models/product_model.dart';

class CategoryEntities extends Table {
  // TODO(freerunningpanda): Возможно убрать autoIncrement и вернуть override.
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get products => text().map(const ProductsConverter())();
}

class ProductsConverter extends TypeConverter<List<ProductModel>, String> {
  const ProductsConverter();

  @override
  List<ProductModel> fromSql(String fromDb) =>
      (jsonDecode(fromDb) as List<dynamic>)
          .map((obj) => ProductModel.fromJson(obj as Map<String, dynamic>))
          .toList();

  @override
  String toSql(List<ProductModel> value) {
    try {
      final json = value.map((e) => e.toJson()).toList();

      return jsonEncode(json);
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }
}
