import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/features/areas/data/models/area_model.dart';
import 'package:upmind_front_client/features/areas/domain/entities/area.dart';

extension AreaFromModel on AreaModel {
  Area toEntity() => Area(
        id: id,
        name: name,
        description: description,
        thumbnail: thumbnail,
      );
}

extension AreaFromDrift on AreaEntity {
  AreaModel fromDrift() => AreaModel(
        id: id,
        name: name,
        description: description,
        thumbnail: thumbnail,
      );
}

extension AreaToDrift on AreaModel {
  AreaEntity toDrift() => AreaEntity(
        id: id,
        name: name,
        description: description,
        thumbnail: thumbnail,
      );
}
