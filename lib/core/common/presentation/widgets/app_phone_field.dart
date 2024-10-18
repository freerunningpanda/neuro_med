import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/helpers/form_validator_helper.dart';

/// Поле для ввода номера телефона
class AppPhoneField extends StatelessWidget {
  const AppPhoneField({
    required this.formKey,
    required this.phoneController,
    this.currentFieldNode,
    this.nextFieldNode,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final PhoneController phoneController;
  final FocusNode? currentFieldNode;
  final FocusNode? nextFieldNode;

  void _onChangedPhone(
    BuildContext context, {
    required PhoneNumber phone,
    FocusNode? focusNode,
  }) {
    phoneController.value = phone;
    FormValidatorHelper.validateForm(
      context,
      formKey: formKey,
    );
    currentFieldNode?.requestFocus();
  }

  void _onEditingCompletePhone(
    BuildContext context, {
    FocusNode? focusNode,
  }) {
    FormValidatorHelper.validateForm(
      context,
      formKey: formKey,
    );
    focusNode?.requestFocus();
  }

  @override
  Widget build(BuildContext context) => PhoneFormField(
        focusNode: currentFieldNode,
        controller: phoneController,
        onChanged: (phone) => _onChangedPhone(
          context,
          phone: phone,
          focusNode: currentFieldNode,
        ),
        onEditingComplete: () => _onEditingCompletePhone(
          context,
          focusNode: nextFieldNode,
        ),
        countryButtonStyle: const CountryButtonStyle(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.commonSize12,
          ),
        ),
        textInputAction: TextInputAction.next,
        validator: PhoneValidator.compose(
          [
            PhoneValidator.required(
              context,
              errorText: context.tr.enterPhoneNumber,
            ),
            PhoneValidator.validMobile(
              context,
              errorText: context.tr.incorrectPhoneNumber,
            ),
          ],
        ),
      );
}
