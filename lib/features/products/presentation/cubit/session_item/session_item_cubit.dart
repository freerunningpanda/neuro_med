import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'session_item_state.dart';

class SessionItemCubit extends Cubit<SessionItemState> {
  SessionItemCubit() : super(const SessionItemState(index: -1));

  void setIndex(int index) {
    emit(SessionItemState(index: index));
  }
}
