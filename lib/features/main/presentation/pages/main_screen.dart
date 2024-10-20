import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/domain/entities/user.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_all_buttons.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/info_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/custom_app_canvas.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/main_screen_content.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:upmind_front_client/features/main/presentation/widgets/areas_widget.dart';

@RoutePage()

/// Главный экран.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.tr.upmind_products;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, state) => switch (state) {
        AuthSuccess _ => _Content(
            title: title,
            user: state.user,
          ),
        _ => _Content(
            title: title,
          ),
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.title,
    this.user,
  });

  final String title;
  final User? user;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: AppScaffold(
          appBar: InfoAppBar(
            title: title,
            trailing: AppAllButtons(
              previousScreenTitle: title,
            ),
          ),
          body: CustomAppCanvas(
            content: AppRippleButton(
              onTap: () => context.push(const AreasRoute()),
              child: const AreasWidget(),
            ),
            hasLowerDivider: false,
            // TODO(freerunningpanda): здесь возможно будет условие.
            // Для отображения контента в зависимости от роли пользователя.
            child: MainScreenContent(
              user: user,
            ),
          ),
        ),
      );
}
