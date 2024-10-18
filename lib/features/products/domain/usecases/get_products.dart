import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';
import 'package:upmind_front_client/features/products/domain/repositories/products_repository.dart';

class GetProducts extends UseCase<IList<Category>, NoParams> {
  GetProducts(this._repository);

  final ProductsRepository _repository;

  @override
  Future<Either<Failure, IList<Category>>> call(NoParams params) =>
      _repository.getProducts();
}
