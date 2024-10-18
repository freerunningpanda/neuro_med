import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/areas/domain/entities/area.dart';

abstract interface class AreaRepository {
  Future<Either<Failure, IList<Area>>> getAreas();
}
