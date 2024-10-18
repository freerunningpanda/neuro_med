import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/session_item/session_item_cubit.dart';

class UserSessionItem extends StatelessWidget {
  const UserSessionItem({
    required this.index,
    required this.userVideo,
    super.key,
  });

  final int index;
  final UserVideo userVideo;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppConstants.commonSize16,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: AppConstants.commonSize6,
            ),
            child: userVideo.status.getIcon(theme) ??
                const SizedBox(
                  width: AppConstants.commonSize16,
                ),
          ),
          BlocBuilder<SessionItemCubit, SessionItemState>(
            builder: (context, state) {
              final isSelected = state.index == index;

              return Text(
                userVideo.name,
                style: theme.primaryTextTheme.bodyMedium?.copyWith(
                  color: isSelected
                      ? theme.colorScheme.onInverseSurface
                      : userVideo.status.getItemColor(theme),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
