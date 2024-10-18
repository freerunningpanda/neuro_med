import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'obscure_text_state.dart';

class ObscureTextCubit extends Cubit<ObscureTextState> {
  ObscureTextCubit() : super(const ObscureTextState());

  static bool _isCurrentPasswordObscure = true;

  void changeCurrentPasswordObscure() {
    _isCurrentPasswordObscure = !_isCurrentPasswordObscure;
    emit(
      ObscureTextState(
        isCurrentPassObscure: _isCurrentPasswordObscure,
      ),
    );
  }
}
