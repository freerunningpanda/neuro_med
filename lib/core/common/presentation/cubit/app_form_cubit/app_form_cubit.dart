import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_form_state.dart';

class AppFormCubit extends Cubit<AppFormState> {
  AppFormCubit()
      : super(
          const AppFormState(
            isFormValid: false,
          ),
        );

  void validateForm({required bool value}) {
    emit(state.copyWith(isFormValid: value));
  }
}
