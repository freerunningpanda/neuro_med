import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouterState());

  /// Устанавливает флаг, что был переход на экран.
  void setNavigation({required bool isNavigated}) {
    emit(RouterState(isNavigated: isNavigated));
  }
}
