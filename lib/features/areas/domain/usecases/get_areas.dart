import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/usecase/usecase.dart';
import 'package:upmind_front_client/features/areas/domain/entities/area.dart';
import 'package:upmind_front_client/features/areas/domain/repositories/area_repository.dart';

class GetAreas extends UseCase<IList<Area>, NoParams> {
  const GetAreas(this._repository);

  final AreaRepository _repository;

  @override
  Future<Either<Failure, IList<Area>>> call(NoParams params) async =>
      _repository.getAreas();
}
