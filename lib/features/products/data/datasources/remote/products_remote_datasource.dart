import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/data/models/category_model.dart';
import 'package:upmind_front_client/features/products/data/models/user_product_model.dart';

abstract interface class ProductsRemoteDatasource {
  Future<IList<CategoryModel>> getProducts();
  Future<IList<UserProductModel>> getUserProducts();
}
