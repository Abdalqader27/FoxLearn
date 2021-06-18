import 'package:flutter/foundation.dart';
import 'package:foxlearn/app/database/dao/pos_loc_dao.dart';
import 'package:foxlearn/app/database/tables/pos_loca_table.dart';
import 'package:foxlearn/common/utils/logs.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'app_db.g.dart';

@UseMoor(
  tables: [PosLocTable],
  daos: [PosLocDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'app_database', logStatements: true));

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (Migrator m, int from, int to) async {},
    beforeOpen: (m) async {
      await customStatement('PRAGMA foreign_keys = ON;');
      if (kDebugMode) {
        Logs.logger.i("database deleted it");
        final m = this.createMigrator(); // changed to this
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }
      }
    },
  );

  @override
  int get schemaVersion => 1;
}
