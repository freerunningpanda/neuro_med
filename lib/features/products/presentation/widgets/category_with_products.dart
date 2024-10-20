import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/category.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/category_header.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/products_carousel.dart';

class CategoryWithProducts extends StatelessWidget {
  const CategoryWithProducts({
    required this.productsCategory,
    required this.index,
    super.key,
  });

  final Category productsCategory;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppConstants.commonSize16,
          ),
          child: CategoryHeader(
            productsCategory: productsCategory,
            index: index,
          ),
        ),
        ProductsCarousel(
          productsCategory: productsCategory,
        ),
      ],
    );
  }
}
