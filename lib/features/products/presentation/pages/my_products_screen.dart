import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_all_buttons.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_error.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/custom_progress_indicator.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/user_products_bloc/user_products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_program_item.dart';

@RoutePage()
class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: ActiveAppBar(
          screenTitle: context.tr.upmind_products,
          trailing: AppAllButtons(
            previousScreenTitle: context.tr.my_products,
          ),
          onTap: () => context.push(
            const MainRoute(),
          ),
        ),
        body: DefaultAppCanvas(
          title: context.tr.my_products,
          child: BlocBuilder<UserProductsBloc, UserProductsState>(
            builder: (_, state) => switch (state) {
              UserProductsLoading _ =>
                CustomProgressIndicator.instance.progressIndicator,
              UserProductsLoaded(userProductList: final userProductList) =>
                ListView.builder(
                  itemCount: userProductList.length,
                  itemBuilder: (_, index) {
                    final userProduct = userProductList[index];

                    return AppRippleButton(
                      onTap: userProduct.status != Status.done
                          ? () => context.push(
                                UserProductDetailRoute(
                                  title: userProduct.name,
                                  previousScreenTitle:
                                      context.tr.upmind_products,
                                  userVideoList: userProduct.videos,
                                  userVideo: userProduct.videos.firstWhere(
                                    (video) =>
                                        video.status == Status.inProgress ||
                                        video.status == Status.newLesson,
                                  ),
                                ),
                              )
                          : null,
                      child: UserProgramItem(
                        userProduct: userProduct,
                      ),
                    );
                  },
                ),
              UserProductsError _ => AppError(
                  onPressed: () => context
                    ..read<UserProductsBloc>().add(
                      LoadUserProducts(),
                    ),
                ),
            },
          ),
        ),
      );
}
