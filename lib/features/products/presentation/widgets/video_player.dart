import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kinescope_sdk/flutter_kinescope_sdk.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_dialog.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/landscape_session_list/landscape_session_list_cubit.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_session_list.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/user_session_switcher.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/viewed_video_button.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer._({
    required this.kinescopeController,
    required this.name,
    required this.isPortrait,
    this.userVideoList = const IList.empty(),
  });

  factory VideoPlayer.portrait({
    required KinescopePlayerController controller,
    required String name,
  }) {
    return VideoPlayer._(
      kinescopeController: controller,
      name: name,
      isPortrait: true,
    );
  }

  factory VideoPlayer.landscape({
    required KinescopePlayerController controller,
    required String name,
    required IList<UserVideo> userVideoList,
  }) {
    return VideoPlayer._(
      kinescopeController: controller,
      name: name,
      isPortrait: false,
      userVideoList: userVideoList,
    );
  }
  final KinescopePlayerController kinescopeController;
  final IList<UserVideo> userVideoList;
  final String name;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        if (isPortrait)
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppConstants.commonSize18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    context.tr.turnTheScreen,
                    style: theme.primaryTextTheme.titleMedium,
                  ),
                ),
                SvgGenImage(Assets.icons.common.orientation.path).svg(),
              ],
            ),
          ),
        Stack(
          children: [
            KinescopePlayer(
              controller: kinescopeController,
            ),
            if (!isPortrait)
              BlocBuilder<LandscapeSessionListCubit, LandscapeSessionListState>(
                builder: (_, state) => Visibility(
                  visible: state.isVisible,
                  replacement: Positioned(
                    left: AppConstants.commonSize6,
                    top: AppConstants.commonSize6,
                    child: GestureDetector(
                      onTap: () => context
                          .read<LandscapeSessionListCubit>()
                          .toggleVisibility(),
                      child: Container(
                        padding: const EdgeInsets.all(AppConstants.commonSize6),
                        decoration: BoxDecoration(
                          color: theme.dividerTheme.color,
                          borderRadius:
                              BorderRadius.circular(AppConstants.commonRadius4),
                        ),
                        child: SvgGenImage(
                          Assets.icons.common.expand.path,
                        ).svg(),
                      ),
                    ),
                  ),
                  child: Positioned(
                    top: AppConstants.commonSize0,
                    bottom: AppConstants.commonSize0,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.commonSize8,
                            horizontal: AppConstants.commonSize24,
                          ),
                          width: MediaQuery.of(context).size.width / 2.7,
                          decoration: BoxDecoration(
                            color: theme.dividerTheme.color,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.tr.programSessions,
                                    style:
                                        theme.primaryTextTheme.headlineMedium,
                                  ),
                                  GestureDetector(
                                    onTap: () => context
                                        .read<LandscapeSessionListCubit>()
                                        .toggleVisibility(),
                                    child: SizedBox(
                                      width: AppConstants.commonSize16,
                                      height: AppConstants.commonSize16,
                                      child: SvgGenImage(
                                        Assets.icons.common.cross.path,
                                      ).svg(),
                                    ),
                                  ),
                                ],
                              ),
                              UserSessionSwitcher(
                                userVideoList: userVideoList,
                              ),
                              UserSessionList(
                                userVideoList: userVideoList,
                                isPortrait: false,
                              ),
                            ],
                          ),
                        ),
                        if (state.isVisible)
                          GestureDetector(
                            onTap: () => context
                                .read<LandscapeSessionListCubit>()
                                .toggleVisibility(),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: theme.hoverColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        // TODO(freerunningpanda): Это просто для теста
        // На будущее, когда на бэке будет метод приёма времени видео
        // Нужно будет реализовать логику, старта видео с нужного момента
        // ElevatedButton(
        //   onPressed: () =>
        //       kinescopeController.seekTo(const Duration(seconds: 5)),
        //   child: const Text('Seek to 2 seconds'),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.commonSize10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: theme.primaryTextTheme.displayMedium,
              ),
              ViewedVideoButton(
                title: context.tr.markAsViewed,
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (context) => AppDialog(
                    title: context.tr.markAsViewed,
                    content: context.tr.markAsViewedDescription,
                    buttonOneTitle:
                        MaterialLocalizations.of(context).cancelButtonLabel,
                    buttonTwoTitle: context.tr.markAsViewed,
                    // TODO(freerunningpanda): Реализовать коллбек
                    actionButtonOnTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}
