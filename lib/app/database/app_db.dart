import 'package:foxlearn/app/database/dao/pos_loc_dao.dart';
import 'package:foxlearn/app/database/tables/pos_loca_table.dart';
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
  int get schemaVersion => 1;
}
