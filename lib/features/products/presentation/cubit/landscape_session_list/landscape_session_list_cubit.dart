import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'landscape_session_list_state.dart';

class LandscapeSessionListCubit extends Cubit<LandscapeSessionListState> {
  LandscapeSessionListCubit()
      : super(const LandscapeSessionListState(isVisible: false));

  void toggleVisibility() {
    emit(LandscapeSessionListState(isVisible: !state.isVisible));
  }
}
