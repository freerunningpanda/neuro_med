import 'package:either_dart/either.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/network/network_info.dart';
import 'package:upmind_front_client/features/areas/data/datasources/local/area_local_datasource.dart';
import 'package:upmind_front_client/features/areas/data/datasources/remote/area_remote_datasource.dart';
import 'package:upmind_front_client/features/areas/data/models/area_model.dart';
import 'package:upmind_front_client/features/areas/domain/entities/area.dart';
import 'package:upmind_front_client/features/areas/domain/repositories/area_repository.dart';

class AreaRepositoryImpl extends BaseRepository implements AreaRepository {
  AreaRepositoryImpl(
    this._localDatasource,
    this._remoteDatasource,
    this._networkInfo, {
    required super.logger,
  });

  final AreaLocalDatasource _localDatasource;
  final AreaRemoteDatasource _remoteDatasource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, IList<Area>>> getAreas() => execute(
        _getAreas,
        const AreasDatasourceFailure(),
      );

  Future<IList<Area>> _getAreas() async {
    final hasConnection = await _networkInfo.hasConnection;

    final IList<AreaModel> areas;

    if (hasConnection) {
      areas = await _remoteDatasource.getAreas();

      for (final area in areas) {
        await _localDatasource.cacheArea(area);
      }

      return areas;
    }

    areas = await _localDatasource.getAreas();

    return areas;
  }
}
