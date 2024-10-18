import 'package:drift/drift.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class UserProductEntities extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get length => integer()();
  TextColumn get name => text()();
  IntColumn get passed => integer()();
  TextColumn get status => textEnum<Status>()();
  TextColumn get thumbnail => text()();
  TextColumn get endDate => text().named('end_date').nullable()();
}
