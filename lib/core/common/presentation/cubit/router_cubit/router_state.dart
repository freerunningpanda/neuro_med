part of 'router_cubit.dart';

class RouterState extends Equatable {
  const RouterState({this.isNavigated = false});

  final bool isNavigated;

  @override
  List<Object?> get props => [isNavigated];
}
