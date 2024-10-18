import 'package:drift/drift.dart';

class AreaEntities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get thumbnail => text()();

  @override
  Set<Column> get primaryKey => {id};
}
