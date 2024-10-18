import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.name,
    this.controller,
    this.onEditingComplete,
    this.node,
    this.onChanged,
    this.maxLines = 1,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.textInputType,
    this.hasError = false,
    super.key,
  });

  final String name;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final void Function(String?)? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLines;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final FocusNode? node;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.commonRadius6),
      child: FormBuilderTextField(
        focusNode: node,
        onEditingComplete: onEditingComplete,
        controller: controller,
        validator: validator,
        name: name,
        obscureText: obscureText,
        onChanged: onChanged,
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: textInputType,
        autocorrect: false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppConstants.commonSize12,
            horizontal: AppConstants.commonSize16,
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.commonRadius6),
            borderSide: BorderSide(
              color: hasError
                  ? theme.colorScheme.error
                  : theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
