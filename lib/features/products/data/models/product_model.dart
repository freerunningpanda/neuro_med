import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/data/mappers/sub_products_mapper.dart';
import 'package:upmind_front_client/features/products/data/models/sub_products_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.name,
    required super.description,
    required super.thumbnail,
    required super.subProducts,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      subProducts: (json['sub_products'] != null)
          ? (json['sub_products'] as List<dynamic>)
              .map((e) => SubProductsModel.fromJson(e as Map<String, dynamic>))
              .toIList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'thumbnail': thumbnail,
        'sub_products': subProducts?.map((e) => e.toModel().toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        name,
        description,
        subProducts,
      ];
}
