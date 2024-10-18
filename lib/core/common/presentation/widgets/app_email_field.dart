import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/helpers/form_validator_helper.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/app_text_field.dart';

/// Поле для ввода email
class AppEmailField extends StatelessWidget {
  const AppEmailField({
    required this.formKey,
    this.focusNode,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => AppTextField(
        node: focusNode,
        name: AppConstants.email,
        onChanged: (_) {
          FormValidatorHelper.validateForm(
            context,
            formKey: formKey,
          );
          focusNode?.requestFocus();
        },
        validator: (value) => FormValidatorHelper.validateEmail(
          context,
          value: value,
        ),
      );
}
