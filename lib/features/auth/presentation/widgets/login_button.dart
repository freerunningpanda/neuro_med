import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/connection_checker/connection_checker_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/router_cubit/router_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_button.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({required this.formKey, super.key});

  final GlobalKey<FormBuilderState> formKey;

  /// Прокидывает данные полей в блок авторизации
  void _onSubmit(BuildContext context) {
    formKey.currentState?.saveAndValidate();

    final login =
        formKey.currentState?.value[AppConstants.authLogin] as String? ?? '';
    final password =
        formKey.currentState?.value[AppConstants.authPassword] as String? ?? '';

    context
      ..read<ConnectionCheckerCubit>().checkConnection()
      ..read<AuthBloc>().add(
        AuthEvent.loginUser(
          login: login,
          password: password,
        ),
      )
      // Устанавливаем флаг, чтоб не было перехода на экран логина.
      ..read<RouterCubit>().setNavigation(isNavigated: false);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AppFormCubit, AppFormState>(
        builder: (_, state) => AppButton(
          onPressed: state.isFormValid ? () => _onSubmit(context) : null,
          title: context.tr.login,
        ),
      );
}
