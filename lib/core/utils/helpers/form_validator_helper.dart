import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/core.dart';

class FormValidatorHelper {
  FormValidatorHelper._();

  static String? validateEmail(
    BuildContext context, {
    String? value,
  }) {
    if (value == null || value.isEmpty) {
      return context.tr.emailCantBeEmpty;
    }
    // Простая проверка на соответствие формату email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return context.tr.enterValidEmail;
    }
    return null;
  }

  static String? validateName(
    BuildContext context, {
    required String? value,
  }) {
    if (value == null || value.isEmpty) {
      return context.tr.fieldCantBeEmpty;
    }

    return null;
  }

  static void validateForm(
    BuildContext context, {
    required GlobalKey<FormBuilderState> formKey,
  }) {
    final cubit = context.read<AppFormCubit>();

    final isFormValid = formKey.currentState?.validate();
    cubit.validateForm(
      value: isFormValid ?? false,
    );
  }
}
