import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/features/areas/data/datasources/local/area_local_datasource.dart';
import 'package:upmind_front_client/features/areas/data/mappers/area_mapper.dart';
import 'package:upmind_front_client/features/areas/data/models/area_model.dart';

class AreaLocalDatasourceImpl implements AreaLocalDatasource {
  AreaLocalDatasourceImpl(this._drift);

  final DriftDatabaseImpl _drift;

  @override
  Future<IList<AreaModel>> getAreas() async {
    try {
      final entities = await _drift.select(_drift.areaEntities).get();

      final areaList = entities.map((obj) => obj.fromDrift()).toIList();

      return areaList;
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }

  @override
  Future<void> cacheArea(AreaModel area) async {
    try {
      final existingAreas = await (_drift.select(_drift.areaEntities)
            ..where((tbl) => tbl.id.equals(area.id)))
          .getSingleOrNull();

      if (existingAreas != null) {
        await (_drift.update(_drift.areaEntities)
              ..where((tbl) => tbl.id.equals(area.id)))
            .write(
          area.toDrift(),
        );

        return;
      }

      await _drift.into(_drift.areaEntities).insert(
            area.toDrift(),
          );
    } on Exception catch (e, trace) {
      throw DriftDatabaseException(e, trace);
    }
  }
}
