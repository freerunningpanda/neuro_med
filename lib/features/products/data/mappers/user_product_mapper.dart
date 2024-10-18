import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/features/products/data/models/user_product_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';

extension UserProductFromModel on UserProductModel {
  UserProduct toUIEntity() => UserProduct(
        name: name,
        length: length,
        passed: passed,
        status: status,
        thumbnail: thumbnail,
        videos: videos,
        endDate: endDate,
      );
}

extension UserProductFromDrift on UserProductEntity {
  UserProductModel fromDrift() => UserProductModel(
        id: id,
        name: name,
        length: length,
        passed: passed,
        status: status,
        thumbnail: thumbnail,
        videos: const IListConst([]),
        endDate: endDate,
      );
}

extension UserProductToDrift on UserProductModel {
  UserProductEntity toDrift() => UserProductEntity(
        id: id,
        name: name,
        length: length,
        passed: passed,
        status: status,
        thumbnail: thumbnail,
        endDate: endDate,
      );
}
