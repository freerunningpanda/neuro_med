part of 'areas_bloc.dart';

sealed class AreasState extends Equatable {
  const AreasState();
}

class AreasLoading extends AreasState {
  @override
  List<Object?> get props => [];
}

class AreasLoaded extends AreasState {
  const AreasLoaded({required this.areaList});

  final IList<Area> areaList;

  @override
  List<Object> get props => [areaList];
}

class AreasError extends AreasState {
  const AreasError({this.message});

  final String? message;

  @override
  List<String?> get props => [message];
}
