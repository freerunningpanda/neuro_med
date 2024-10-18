import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/helpers/auth_bloc_helper.dart';
import 'package:upmind_front_client/core/utils/helpers/form_validator_helper.dart';

class AppMessageTextField extends StatelessWidget {
  const AppMessageTextField({
    required this.formKey,
    this.focusNode,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        FormBuilderTextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.inputDecorationTheme.fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.commonRadius6),
              borderSide: BorderSide(
                color: AuthBlocHelper.instance.getErrorState(context)
                    ? theme.colorScheme.error
                    : theme.colorScheme.onPrimaryContainer,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.commonRadius6),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
              ),
            ),
          ),
          focusNode: focusNode,
          name: AppConstants.message,
          onChanged: (_) {
            FormValidatorHelper.validateForm(
              context,
              formKey: formKey,
            );

            focusNode?.requestFocus();
          },
          maxLines: 4,
          textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.visiblePassword,
          autocorrect: false,
          textInputAction: TextInputAction.next,
          validator: (value) => FormValidatorHelper.validateName(
            context,
            value: value,
          ),
        ),
      ],
    );
  }
}
