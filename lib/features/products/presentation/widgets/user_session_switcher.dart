import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_swicher.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/user_products_bloc/user_products_bloc.dart';

class UserSessionSwitcher extends StatelessWidget {
  const UserSessionSwitcher({
    required this.userVideoList,
    super.key,
  });

  final IList<UserVideo> userVideoList;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.commonSize24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr.hidePassedSessions,
            style: theme.primaryTextTheme.displayMedium?.copyWith(
              color: theme.colorScheme.inverseSurface,
            ),
          ),
          BlocBuilder<UserProductsBloc, UserProductsState>(
            builder: (_, state) => switch (state) {
              UserProductsLoaded _ => Transform.scale(
                  scale: 0.8,
                  child: AppSwitcher(
                    isActive: state.isPassedToggleOn,
                    onChanged: (isHidden) =>
                        context.read<UserProductsBloc>().add(
                              GetFilteredProducts(
                                isHidden: isHidden,
                                filteredVideoList: userVideoList,
                              ),
                            ),
                  ),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }
}
