import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/contact_the_admin_form_content.dart';

@RoutePage()
class ContactTheAdminScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const ContactTheAdminScreen({
    required this.previousScreenTitle,
    super.key,
  });

  final String previousScreenTitle;

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: ActiveAppBar(
          screenTitle: previousScreenTitle,
        ),
        body: DefaultAppCanvas(
          hasCross: true,
          title: context.tr.contactTheAdmin,
          child: const ContactTheAdminFormContent(),
        ),
      );

  /// Используется в экранах где есть форма.
  /// Чтобы состояния формы были раздельными для каждого экрана.
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => sl<AppFormCubit>(),
        child: this,
      );
}
