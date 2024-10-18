import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/network/network_info.dart';
import 'package:upmind_front_client/features/products/data/datasources/local/products_local_datasource.dart';
import 'package:upmind_front_client/features/products/data/datasources/remote/products_remote_datasource.dart';
import 'package:upmind_front_client/features/products/data/models/category_model.dart';
import 'package:upmind_front_client/features/products/data/models/user_product_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';
import 'package:upmind_front_client/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends BaseRepository
    implements ProductsRepository {
  ProductsRepositoryImpl(
    this._localDatasource,
    this._remoteDatasource,
    this._networkInfo, {
    required super.logger,
  });

  final ProductsLocalDatasource _localDatasource;
  final ProductsRemoteDatasource _remoteDatasource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, IList<Category>>> getProducts() async => execute(
        _getProducts,
        const ProductsDatasourceFailure(),
      );

  Future<IList<Category>> _getProducts() async {
    final hasConnection = await _networkInfo.hasConnection;

    final IList<CategoryModel> categoryList;

    if (hasConnection) {
      categoryList = await _remoteDatasource.getProducts();

      for (final category in categoryList) {
        await _localDatasource.cacheProducts(category);
      }

      return categoryList;
    }

    categoryList = await _localDatasource.getProducts();

    return categoryList;
  }

  @override
  Future<Either<Failure, IList<UserProduct>>> getUserProducts() async =>
      execute(
        _getUserProducts,
        const ProductsDatasourceFailure(),
      );

  Future<IList<UserProduct>> _getUserProducts() async {
    final hasConnection = await _networkInfo.hasConnection;

    final IList<UserProductModel> userProductList;

    if (hasConnection) {
      userProductList = await _remoteDatasource.getUserProducts();

      for (final userProduct in userProductList) {
        await _localDatasource.cacheUserProduct(userProduct);
      }

      return userProductList;
    }

    userProductList = await _localDatasource.getUserProducts();

    return userProductList;
  }
}
