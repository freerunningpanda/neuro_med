import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/helpers/auth_bloc_helper.dart';
import 'package:upmind_front_client/core/utils/helpers/form_validator_helper.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/app_text_field.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/password_text_field_widget.dart';

class AuthTextFields extends StatelessWidget {
  const AuthTextFields({
    required this.formKey,
    super.key,
  });
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final hasError = AuthBlocHelper.getErrorState(context);
    final loginFocusNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstants.sizedBoxH14,
        if (hasError)
          Column(
            children: [
              Text(
                context.tr.invalidLoginOrPassword,
                style: hasError
                    ? context.theme.primaryTextTheme.labelMedium
                        ?.copyWith(color: context.theme.colorScheme.error)
                    : context.theme.primaryTextTheme.labelMedium,
              ),
            ],
          ),
        AppConstants.sizedBoxH10,
        Text(
          context.tr.enterLogin,
          style: hasError
              ? context.theme.primaryTextTheme.labelMedium
                  ?.copyWith(color: context.theme.colorScheme.error)
              : context.theme.primaryTextTheme.labelMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppConstants.commonSize4,
            bottom: AppConstants.commonSize14,
          ),
          child: AppTextField(
            node: loginFocusNode,
            hasError: hasError,
            onChanged: (_) {
              FormValidatorHelper.validateForm(
                context,
                formKey: formKey,
              );
              loginFocusNode.requestFocus();
            },
            name: AppConstants.authLogin,
            validator: (value) => FormValidatorHelper.validateEmail(
              context,
              value: value,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppConstants.commonSize4,
          ),
          child: Text(
            context.tr.enterPassword,
            style: hasError
                ? context.theme.primaryTextTheme.labelMedium
                    ?.copyWith(color: context.theme.colorScheme.error)
                : context.theme.primaryTextTheme.labelMedium,
          ),
        ),
        PasswordTextFieldWidget(
          formKey: formKey,
          hasError: hasError,
        ),
      ],
    );
  }
}
