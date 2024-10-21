import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_error.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/custom_progress_indicator.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/user_products_bloc/user_products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/category_with_products.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/my_programs_main.dart';

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({
    required this.user,
    super.key,
  });

  final User? user;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            switch (user?.role) {
              UserRole.patient =>
                BlocBuilder<UserProductsBloc, UserProductsState>(
                  builder: (_, state) => switch (state) {
                    UserProductsLoading() =>
                      CustomProgressIndicator.progressIndicator,
                    UserProductsLoaded(
                      userProductList: final userProductList
                    ) =>
                      MyProgramsMain(
                        userProductList: userProductList,
                      ),
                    UserProductsError() => AppError(
                        onPressed: () => context
                          ..read<UserProductsBloc>().add(
                            LoadUserProducts(),
                          ),
                      ),
                  },
                ),
              _ => const SizedBox.shrink(),
            },
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (_, state) => switch (state) {
                ProductsLoading _ => CustomProgressIndicator.progressIndicator,
                ProductsLoaded(productList: final productList) => Column(
                    children: List.generate(
                      productList.length,
                      (index) {
                        final productsCategory = productList[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                            top: AppConstants.commonSize12,
                          ),
                          child: CategoryWithProducts(
                            productsCategory: productsCategory,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ProductsError _ => AppError(
                    onPressed: () => context
                      ..read<ProductsBloc>().add(
                        LoadProducts(),
                      ),
                  ),
              },
            ),
          ],
        ),
      );
}
