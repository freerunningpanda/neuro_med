import 'package:drift/drift.dart';

class UserNotificationEntities extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get date => text()();

  @override
  Set<Column> get primaryKey => {id};
}
