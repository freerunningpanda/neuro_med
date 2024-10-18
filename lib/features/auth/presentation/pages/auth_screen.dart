import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/auth_form_content.dart';

@RoutePage()

/// Экран авторизации.
class AuthScreen extends StatelessWidget implements AutoRouteWrapper {
  const AuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (_, state) => state.whenOrNull(
          success: (_) => context.replace(const MyProductsRoute()),
        ),
        child: AppScaffold(
          appBar: ActiveAppBar(
            isAuthScreen: true,
            screenTitle: context.tr.upmind_products,
          ),
          body: const AuthFormContent(),
        ),
      );

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<ObscureTextCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<AppFormCubit>(),
          ),
        ],
        child: this,
      );
}
