import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/data/models/product_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required this.id,
    required super.title,
    required IList<ProductModel> products,
  })  : _products = products,
        super(
          products: products,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      title: json['title'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toIList(),
    );
  }

  final int id;
  final IList<ProductModel> _products;

  @override
  IList<ProductModel> get products => _products;

  @override
  List<Object?> get props => [
        id,
        title,
        products,
      ];
}
