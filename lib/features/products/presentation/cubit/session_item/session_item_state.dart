part of 'session_item_cubit.dart';

class SessionItemState extends Equatable {
  const SessionItemState({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}
