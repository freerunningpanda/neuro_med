import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_email_field.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_message_text_field.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_phone_field.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class ContactTheAdminFormContent extends StatelessWidget {
  const ContactTheAdminFormContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final phoneController = PhoneController();
    final formKey = GlobalKey<FormBuilderState>();
    final emailFocusNode = FocusNode();
    final phoneFocusNode = FocusNode();
    final messageFocusNode = FocusNode();

    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
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
                      bottom: AppConstants.commonSize4,
                    ),
                    child: Text(
                      context.tr.yourEmail,
                      style: context.theme.primaryTextTheme.labelMedium,
                    ),
                  ),
                  AppEmailField(
                    formKey: formKey,
                    focusNode: emailFocusNode,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppConstants.commonSize6,
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
                    currentFieldNode: phoneFocusNode,
                    nextFieldNode: messageFocusNode,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppConstants.commonSize16,
                      bottom: AppConstants.commonSize4,
                    ),
                    child: Text(
                      context.tr.yourMessage,
                      style: context.theme.primaryTextTheme.labelMedium,
                    ),
                  ),
                  AppMessageTextField(
                    formKey: formKey,
                    focusNode: messageFocusNode,
                  ),
                  AppConstants.sizedBoxH28,
                  Center(
                    child: BlocBuilder<AppFormCubit, AppFormState>(
                      builder: (_, state) => AppButton(
                        title: context.tr.send,
                        onPressed: state.isFormValid ? () {} : null,
                      ),
                    ),
                  ),
                  AppConstants.sizedBoxH36,
                ],
              ),
            ),
            const AppDivider(),
          ],
        ),
      ),
    );
  }
}
