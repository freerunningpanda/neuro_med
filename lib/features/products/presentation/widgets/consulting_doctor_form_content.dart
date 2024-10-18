import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_phone_field.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/helpers/form_validator_helper.dart';

class ConsultingDoctorFormContent extends StatelessWidget {
  const ConsultingDoctorFormContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final phoneController = PhoneController();
    final nameController = TextEditingController();
    final formKey = GlobalKey<FormBuilderState>();
    final nameFocusNode = FocusNode();

    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.commonSize24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppConstants.commonSize10,
                    bottom: AppConstants.commonSize2,
                  ),
                  child: Text(
                    context.tr.enterPhone,
                    style: context.theme.primaryTextTheme.labelMedium,
                  ),
                ),
                AppPhoneField(
                  formKey: formKey,
                  phoneController: phoneController,
                  nextFieldNode: nameFocusNode,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppConstants.commonSize24,
                    bottom: AppConstants.commonSize4,
                  ),
                  child: Text(
                    context.tr.enterYourName,
                    style: context.theme.primaryTextTheme.labelMedium,
                  ),
                ),
                AppNameField(
                  formKey: formKey,
                  nameController: nameController,
                  focusNode: nameFocusNode,
                ),
                AppConstants.sizedBoxH24,
                Center(
                  child: BlocBuilder<AppFormCubit, AppFormState>(
                    builder: (_, state) => AppButton(
                      onPressed: state.isFormValid ? () {} : null,
                      title: context.tr.getConsultation,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Поле для ввода имени
class AppNameField extends StatelessWidget {
  const AppNameField({
    required this.formKey,
    required this.nameController,
    required this.focusNode,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final TextEditingController nameController;
  final FocusNode focusNode;

  void _onChangedName(
    BuildContext context, {
    required String name,
  }) {
    nameController.text = name;
    FormValidatorHelper.validateForm(
      context,
      formKey: formKey,
    );
  }

  void _onEditingCompleteName(
    BuildContext context,
  ) {
    focusNode.unfocus();
    FormValidatorHelper.validateForm(
      context,
      formKey: formKey,
    );
  }

  String? _validateName(
    BuildContext context, {
    String? name,
  }) {
    if (name == null || name.isEmpty) {
      return context.tr.nameIsEmpty;
    }

    if (name.length < 2) {
      return context.tr.nameLength;
    }

    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(name)) {
      return context.tr.nameConditions;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: nameController,
      onChanged: (value) => _onChangedName(
        context,
        name: value,
      ),
      onEditingComplete: () => _onEditingCompleteName(context),
      validator: (value) => _validateName(
        context,
        name: value,
      ),
    );
  }
}
