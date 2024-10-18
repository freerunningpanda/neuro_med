import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/forgot_password_form_content.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget implements AutoRouteWrapper {
  const ForgotPasswordScreen({
    required this.previousScreenTitle,
    super.key,
  });

  final String previousScreenTitle;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return AppScaffold(
      appBar: ActiveAppBar(
        screenTitle: previousScreenTitle,
      ),
      body: DefaultAppCanvas(
        hasCross: true,
        title: context.tr.forgotPassword,
        child: ForgotPasswordFormContent(
          formKey: formKey,
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<AppFormCubit>(
        create: (_) => sl(),
        child: this,
      );
}
