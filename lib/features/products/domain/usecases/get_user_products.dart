import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';
import 'package:upmind_front_client/features/products/domain/repositories/products_repository.dart';

class GetUserProducts extends UseCase<IList<UserProduct>, NoParams> {
  GetUserProducts(this.repository);

  final ProductsRepository repository;

  @override
  Future<Either<Failure, IList<UserProduct>>> call(NoParams params) =>
      repository.getUserProducts();
}
