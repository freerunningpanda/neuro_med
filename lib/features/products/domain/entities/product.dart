import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/domain/entities/sub_products.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.description,
    required this.thumbnail,
    this.subProducts,
  });

  final String name;
  final String description;
  final String thumbnail;
  final IList<SubProducts>? subProducts;

  @override
  List<Object?> get props => [
        name,
        description,
        thumbnail,
        subProducts,
      ];
}
