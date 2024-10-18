part of 'app_form_cubit.dart';

class AppFormState extends Equatable {
  const AppFormState({
    required this.isFormValid,
  });

  @override
  List<Object> get props => [
        isFormValid,
      ];

  final bool isFormValid;

  AppFormState copyWith({
    bool? isFormValid,
  }) {
    return AppFormState(
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
