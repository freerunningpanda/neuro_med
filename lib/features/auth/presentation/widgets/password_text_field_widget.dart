import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_text_field_password_eye.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/app_text_field.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    required this.formKey,
    this.hasError = false,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final bool hasError;

  void _validateForm(BuildContext context) {
    final cubit = context.read<AppFormCubit>();

    final isFormValid = formKey.currentState?.validate();
    cubit.validateForm(
      value: isFormValid ?? false,
    );
  }

  String? _validatePassword(
    BuildContext context, {
    String? password,
  }) {
    if (password == null || password.isEmpty) {
      return context.tr.fieldCantBeEmpty;
    }

    if (password.length < 6) {
      return context.tr.minPasswordLength;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final passwordFocusNode = FocusNode();

    return BlocBuilder<ObscureTextCubit, ObscureTextState>(
      builder: (context, state) => AppTextField(
        hasError: hasError,
        node: passwordFocusNode,
        onChanged: (_) {
          _validateForm(context);
          passwordFocusNode.requestFocus();
        },
        name: AppConstants.authPassword,
        obscureText: state.isCurrentPassObscure,
        textInputType: TextInputType.emailAddress,
        suffixIcon: TextFieldPasswordEyeWidget(
          obscure: state.isCurrentPassObscure,
          onTap: () =>
              context.read<ObscureTextCubit>().changeCurrentPasswordObscure(),
        ),
        validator: (value) => _validatePassword(
          context,
          password: value,
        ),
      ),
    );
  }
}
