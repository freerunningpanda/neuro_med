import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/user_products_bloc/user_products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/custom_tooltip.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_session_item.dart';

class UserSessionList extends StatelessWidget {
  const UserSessionList({
    required this.userVideoList,
    this.isPortrait = true,
    super.key,
  });

  final IList<UserVideo> userVideoList;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UserProductsBloc, UserProductsState>(
        builder: (_, state) => switch (state) {
          UserProductsLoaded(filteredVideoList: final filteredVideoList) =>
            Expanded(
              child: ListView.builder(
                itemCount: filteredVideoList?.length ?? userVideoList.length,
                itemBuilder: (context, index) {
                  final userVideo =
                      filteredVideoList?[index] ?? userVideoList[index];
                  return CustomTooltip(
                    index: index,
                    userVideo: userVideo,
                    isPortrait: isPortrait,
                    child: UserSessionItem(
                      index: index,
                      userVideo: userVideo,
                    ),
                  );
                },
              ),
            ),
          _ => const SizedBox.shrink(),
        },
      );
}
