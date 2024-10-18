import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/areas/domain/entities/area.dart';
import 'package:upmind_front_client/features/areas/domain/usecases/get_areas.dart';

part 'areas_event.dart';
part 'areas_state.dart';

typedef _Emit = Emitter<AreasState>;

class AreasBloc extends Bloc<AreasEvent, AreasState> {
  AreasBloc(this.getAreas) : super(AreasLoading()) {
    on<LoadAreas>(_loadAreas);
  }

  final GetAreas getAreas;

  Future<void> _loadAreas(LoadAreas event, _Emit emit) async {
    await getAreas.call(NoParams()).fold(
          (failure) => emit(AreasError(message: failure.error ?? '')),
          (areaList) => emit(
            AreasLoaded(
              areaList: areaList,
            ),
          ),
        );
  }
}
