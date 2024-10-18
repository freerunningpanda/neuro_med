import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/session_item/session_item_cubit.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/bottom_sheet_content.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_session_list_burger.dart';

class PassedSessions extends StatelessWidget {
  const PassedSessions({
    required this.userVideoList,
    super.key,
  });

  final IList<UserVideo> userVideoList;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppRippleButton(
      onTap: () async {
        // Ожидаем закрытия BottomSheet
        await showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) => BlocProvider.value(
            value: context.read<SessionItemCubit>(),
            child: BottomSheetContent(userVideoList: userVideoList),
          ),
        );
      },
      child: Container(
        color: theme.scaffoldBackgroundColor,
        height: AppConstants.bottomWidgetHeight,
        child: Column(
          children: [
            UserSessionListBurger(userVideoList: userVideoList),
            const AppDivider(),
          ],
        ),
      ),
    );
  }
}
