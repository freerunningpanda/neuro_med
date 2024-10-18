import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/areas/data/models/area_model.dart';

abstract interface class AreaRemoteDatasource {
  Future<IList<AreaModel>> getAreas();
}
