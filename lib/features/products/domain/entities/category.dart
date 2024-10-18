import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/domain/entities/product.dart';

class Category extends Equatable {
  const Category({
    required this.title,
    required this.products,
  });

  final String title;
  final IList<Product> products;

  @override
  List<Object?> get props => [
        title,
        products,
      ];
}
