import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_something_went_wrong.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/custom_progress_indicator.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/enums/user_role.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/user_products_bloc/user_products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/category_with_products.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/my_programs_main.dart';

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({
    required this.userRole,
    super.key,
  });

  final UserRole userRole;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            // TODO(freerunningpanda): здесь будет переключение ролей.
            if (userRole != UserRole.guest)
              BlocBuilder<UserProductsBloc, UserProductsState>(
                builder: (_, state) => switch (state) {
                  UserProductsLoading() =>
                    CustomProgressIndicator().progressIndicator,
                  UserProductsLoaded(userProductList: final userProductList) =>
                    MyProgramsMain(
                      userProductList: userProductList,
                      userRole: userRole,
                    ),
                  UserProductsError() => AppSomethingWentWrong(
                      onPressed: () => context
                        ..read<UserProductsBloc>().add(
                          LoadUserProducts(),
                        ),
                    ),
                },
              ),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (_, state) => switch (state) {
                ProductsLoading _ =>
                  CustomProgressIndicator.instance.progressIndicator,
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
                            userRole: userRole,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ProductsError _ => AppSomethingWentWrong(
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
