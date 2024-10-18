import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/auth_body.dart';
import 'package:upmind_front_client/features/auth/presentation/widgets/auth_footer.dart';

/// Форма авторизации.
class AuthFormContent extends StatelessWidget {
  const AuthFormContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return DefaultAppCanvas(
      title: context.tr.loginToPersonalAccount,
      isAuthScreen: true,
      hasCross: true,
      child: ListView(
        children: [
          FormBuilder(
            key: formKey,
            child: AuthBody(
              formKey: formKey,
            ),
          ),
          const AppDivider(),
          const AuthFooter(),
        ],
      ),
    );
  }
}
