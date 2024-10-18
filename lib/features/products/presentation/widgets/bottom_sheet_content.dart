import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_fringe.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_session_list.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_session_switcher.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    required this.userVideoList,
    super.key,
  });

  final IList<UserVideo> userVideoList;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.commonSize24,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConstants.commonSize16),
          topRight: Radius.circular(AppConstants.commonSize16),
        ),
        color: theme.dividerTheme.color,
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: AppFringe(),
          ),
          Text(
            context.tr.programSessions,
            style: theme.primaryTextTheme.headlineMedium,
          ),
          UserSessionSwitcher(
            userVideoList: userVideoList,
          ),
          UserSessionList(userVideoList: userVideoList),
        ],
      ),
    );
  }
}
