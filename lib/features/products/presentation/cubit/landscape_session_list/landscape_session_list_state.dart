part of 'landscape_session_list_cubit.dart';

class LandscapeSessionListState extends Equatable {
  const LandscapeSessionListState({
    required this.isVisible,
  });

  final bool isVisible;

  @override
  List<Object?> get props => [isVisible];
}
