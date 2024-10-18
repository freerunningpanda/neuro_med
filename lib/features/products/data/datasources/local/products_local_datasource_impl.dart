import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/features/products/data/datasources/local/products_local_datasource.dart';
import 'package:upmind_front_client/features/products/data/mappers/category_mapper.dart';
import 'package:upmind_front_client/features/products/data/mappers/user_product_mapper.dart';
import 'package:upmind_front_client/features/products/data/models/category_model.dart';
import 'package:upmind_front_client/features/products/data/models/user_product_model.dart';

class ProductsLocalDatasourceImpl implements ProductsLocalDatasource {
  const ProductsLocalDatasourceImpl(this._drift);

  final DriftDatabaseImpl _drift;

  @override
  Future<IList<CategoryModel>> getProducts() async {
    try {
      final entities = await _drift.select(_drift.categoryEntities).get();

      final categoryList = entities.map((obj) => obj.fromDrift()).toIList();

      return categoryList;
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }

  @override
  Future<void> cacheProducts(CategoryModel product) async {
    try {
      final existingProducts = await (_drift.select(_drift.categoryEntities)
            ..where((tbl) => tbl.id.equals(product.id)))
          .getSingleOrNull();

      if (existingProducts != null) {
        await (_drift.update(_drift.categoryEntities)
              ..where((tbl) => tbl.id.equals(product.id)))
            .write(
          product.toDrift(),
        );

        return;
      }

      await _drift.into(_drift.categoryEntities).insert(
            product.toDrift(),
          );
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }

  @override
  Future<IList<UserProductModel>> getUserProducts() async {
    try {
      final entities = await _drift.select(_drift.userProductEntities).get();

      final userProductList = entities.map((obj) => obj.fromDrift()).toIList();

      return userProductList;
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }

  @override
  Future<void> cacheUserProduct(UserProductModel userProduct) async {
    try {
      final existingProducts = await (_drift.select(_drift.userProductEntities)
            ..where((tbl) => tbl.id.equals(userProduct.id)))
          .getSingleOrNull();

      if (existingProducts != null) {
        await (_drift.update(_drift.userProductEntities)
              ..where((tbl) => tbl.id.equals(userProduct.id)))
            .write(
          userProduct.toDrift(),
        );

        return;
      }

      await _drift.into(_drift.userProductEntities).insert(
            userProduct.toDrift(),
          );
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }
}
