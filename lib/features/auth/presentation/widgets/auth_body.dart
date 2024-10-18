import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/actions_buttons.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/auth_text_fields.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    required this.formKey,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.commonSize24,
        ),
        child: Column(
          children: [
            AuthTextFields(
              formKey: formKey,
            ),
            ActionsButtons(formKey: formKey),
          ],
        ),
      );
}
