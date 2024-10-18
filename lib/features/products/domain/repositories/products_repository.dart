import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';

abstract interface class ProductsRepository {
  Future<Either<Failure, IList<Category>>> getProducts();
  Future<Either<Failure, IList<UserProduct>>> getUserProducts();
}
