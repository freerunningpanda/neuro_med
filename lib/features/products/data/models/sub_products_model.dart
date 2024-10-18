import 'package:upmind_front_client/features/products/domain/entities/sub_products.dart';

class SubProductsModel extends SubProducts {
  const SubProductsModel({
    required super.name,
    required super.description,
    required super.thumbnail,
  });

  factory SubProductsModel.fromJson(Map<String, dynamic> json) {
    return SubProductsModel(
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'thumbnail': thumbnail,
      };
}
