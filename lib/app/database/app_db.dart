
import 'package:moor_flutter/moor_flutter.dart';


part 'app_db.g.dart';

@UseMoor(
  tables: [],
  daos: [],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'app_database', logStatements: true));

  @override
  int get schemaVersion => 1;
}
