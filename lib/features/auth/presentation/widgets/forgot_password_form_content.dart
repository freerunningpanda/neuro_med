import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_email_field.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class ForgotPasswordFormContent extends StatelessWidget {
  const ForgotPasswordFormContent({
    required this.formKey,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return FormBuilder(
      key: formKey,
      child: Column(
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
                    top: AppConstants.commonSize16,
                    bottom: AppConstants.commonSize20,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: theme.primaryTextTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                      children: [
                        TextSpan(
                          text: '${context.tr.passwordResetDescr}\n',
                        ),
                        TextSpan(
                          text: context.tr.newPasswordDescr,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  context.tr.yourEmail,
                  style: context.theme.primaryTextTheme.labelMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppConstants.commonSize4,
                    bottom: AppConstants.commonSize28,
                  ),
                  child: AppEmailField(formKey: formKey),
                ),
                Center(
                  child: BlocBuilder<AppFormCubit, AppFormState>(
                    builder: (_, state) => AppButton(
                      title: context.tr.send,
                      // TODO(freerunningpanda): реализовать коллбэк
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
    );
  }
}
