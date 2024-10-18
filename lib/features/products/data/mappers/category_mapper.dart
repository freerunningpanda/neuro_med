import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/features/products/data/mappers/product_mapper.dart';
import 'package:upmind_front_client/features/products/data/models/category_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';

extension CategoryMapper on Category {
  Category toUIEntity() => Category(
        title: title,
        products: products.map((e) => e.toUIEntity()).toIList(),
      );
}

extension CategoryDriftMapper on CategoryEntity {
  CategoryModel fromDrift() => CategoryModel(
        id: id,
        title: title,
        products: products.map((e) => e.toModel()).toIList(),
      );
}

extension CategoryToDriftMapper on CategoryModel {
  CategoryEntity toDrift() => CategoryEntity(
        id: id,
        title: title,
        products: products.map((e) => e.toModel()).toList(),
      );
}
