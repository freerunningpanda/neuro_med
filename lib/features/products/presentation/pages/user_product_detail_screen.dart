import 'package:auto_route/auto_route.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kinescope_sdk/flutter_kinescope_sdk.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_all_buttons.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/helpers/screen_orientation_helper.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/landscape_session_list/landscape_session_list_cubit.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/session_item/session_item_cubit.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/passed_sessions.dart';
import 'package:upmind_front_client/features/products/presentation/widgets/video_player.dart';

@RoutePage()
class UserProductDetailScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const UserProductDetailScreen({
    required this.title,
    required this.previousScreenTitle,
    required this.userVideoList,
    required this.userVideo,
    super.key,
  });

  final String title;
  final String previousScreenTitle;
  final IList<UserVideo> userVideoList;
  final UserVideo userVideo;

  @override
  State<UserProductDetailScreen> createState() =>
      _UserProductDetailScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<SessionItemCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<LandscapeSessionListCubit>(),
          ),
        ],
        child: this,
      );
}

class _UserProductDetailScreenState extends State<UserProductDetailScreen> {
  late KinescopePlayerController _kinescopeController;

  @override
  void initState() {
    super.initState();
    _kinescopeController = KinescopePlayerController(
      widget.userVideo.kinescopeId,
    );
    ScreenOrientationHelper.setAll();
  }

  @override
  void dispose() {
    ScreenOrientationHelper.setPortrait();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return AppScaffold(
      appBar: isPortrait
          ? ActiveAppBar(
              screenTitle: widget.previousScreenTitle,
              trailing: AppAllButtons(
                previousScreenTitle: widget.title,
              ),
            )
          : null,
      body: Stack(
        children: [
          DefaultAppCanvas(
            title: widget.title,
            isPortrait: isPortrait,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.commonSize24,
                  vertical: AppConstants.commonSize10,
                ),
                child: isPortrait
                    ? VideoPlayer.portrait(
                        controller: _kinescopeController,
                        name: widget.userVideo.name,
                      )
                    : VideoPlayer.landscape(
                        controller: _kinescopeController,
                        name: widget.userVideo.name,
                        userVideoList: widget.userVideoList,
                      ),
              ),
            ),
          ),
          if (widget.userVideo.status != Status.inProgress)
            // TODO(freerunningpanda): Переделать заглушку
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
        ],
      ),
      bottomNavigationBar: isPortrait
          ? PassedSessions(
              userVideoList: widget.userVideoList,
            )
          : null,
    );
  }
}
