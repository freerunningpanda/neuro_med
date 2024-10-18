part of 'connection_checker_cubit.dart';

class ConnectionCheckerState extends Equatable {
  const ConnectionCheckerState({required this.isConnected});
  final bool isConnected;

  @override
  List<Object> get props => [isConnected];
}
