part of 'obscure_text_cubit.dart';

class ObscureTextState extends Equatable {
  const ObscureTextState({
    this.isCurrentPassObscure = true,
  });

  final bool isCurrentPassObscure;

  @override
  List<Object> get props => [
        isCurrentPassObscure,
      ];
}
