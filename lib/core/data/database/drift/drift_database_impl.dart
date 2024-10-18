// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:upmind_front_client/features/areas/data/datasources/local/drift_tables/area_entities.dart';
import 'package:upmind_front_client/features/products/data/datasources/local/drift_tables/category_entities.dart';
import 'package:upmind_front_client/features/products/data/datasources/local/drift_tables/user_product_entities.dart';
import 'package:upmind_front_client/features/products/data/models/product_model.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/local/drift_tables/user_notification_entities.dart';

part 'drift_database_impl.g.dart';

@DriftDatabase(
  tables: [
    CategoryEntities,
    UserProductEntities,
    AreaEntities,
    UserNotificationEntities,
  ],
)
class DriftDatabaseImpl extends _$DriftDatabaseImpl {
  DriftDatabaseImpl({
    QueryExecutor? executor,
  }) : super(executor ??= _openConnection());

  Future<void> deleteEverything() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      await transaction(() async {
        for (final table in allTables) {
          await delete(table).go();
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(
      () async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'oazis_pro_v2.db.enc'));

        return NativeDatabase(
          file,
          setup: (db) {
            // Check that we're actually running with SQLCipher by quering the
            // cipher_version pragma.
            final result = db.select('pragma cipher_version');
            if (result.isEmpty) {
              throw UnsupportedError(
                'This database needs to run with SQLCipher, but that library is '
                'not available!',
              );
            }

            // Then, apply the key to encrypt the database. Unfortunately, this
            // pragma doesn't seem to support prepared statements so we inline the
            // key.
            const escapedKey =
                'a03960226d632336a778f46dbab8fa2b264b982d0eb4556443a7009eb83bfcd9';
            db
              ..execute("pragma key = '$escapedKey'")

              // Test that the key is correct by selecting from a table
              ..execute('select count(*) from sqlite_master');
          },
        );
      },
    );
