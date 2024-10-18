import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/data/mappers/sub_products_mapper.dart';
import 'package:upmind_front_client/features/products/data/models/product_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/product.dart';

extension ProductMapper on Product {
  Product toUIEntity() => Product(
        name: name,
        description: description,
        thumbnail: thumbnail,
        subProducts: subProducts?.map((e) => e.toUIEntity()).toIList(),
      );

  ProductModel toModel() => ProductModel(
        name: name,
        description: description,
        thumbnail: thumbnail,
        subProducts: subProducts?.map((e) => e.toModel()).toIList(),
      );
}
