part of 'areas_bloc.dart';

sealed class AreasEvent {
  const AreasEvent();
}

class LoadAreas extends AreasEvent {
  const LoadAreas();
}
