import 'package:upmind_front_client/features/products/data/models/sub_products_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/sub_products.dart';

extension SubProductsMapper on SubProducts {
  SubProducts toUIEntity() => SubProducts(
        name: name,
        description: description,
        thumbnail: thumbnail,
      );

  SubProductsModel toModel() => SubProductsModel(
        name: name,
        description: description,
        thumbnail: thumbnail,
      );
}
