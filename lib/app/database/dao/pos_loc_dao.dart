import 'package:foxlearn/app/database/app_db.dart';
import 'package:foxlearn/app/database/tables/pos_loca_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'pos_loc_dao.g.dart';

@UseDao(
  tables: [PosLocTable],
)
class PosLocDao extends DatabaseAccessor<AppDatabase> with _$PosLocDaoMixin {
  final AppDatabase db;

  PosLocDao(this.db) : super(db);

//
  Future insert(Insertable<PosLocTableData> data) =>
      (transaction(() => batch((batch) => batch.insert(posLocTable, data))));

  Future insertAll(List<PosLocTableData> dataList) async =>
      await (transaction(() => batch(
          (batch) => batch.insertAllOnConflictUpdate(posLocTable, dataList))));

  Stream<List<PosLocTableData>> watchAllWithLatLong() {
    return select(posLocTable).watch();
  }

//
  Future<List<String>> getMapSuggestion(name) async {
    final query = selectOnly(posLocTable);
    query.addColumns([posLocTable.name]);
    return query.map((e) => (e.read(posLocTable.name))!).get();
  }

//
  Future<List<PosLocTableData>> getPosByName(name) async {
    final query = select(posLocTable)..where((tbl) => tbl.name.contains(name));
    return query.get();
  }

//
  Future<PosLocTableData?> getWithLatLongById(int? id) {
    final query = select(posLocTable)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

//
  Future<int> getCount() {
    final count = posLocTable.id.count();
    final query = selectOnly(posLocTable)..addColumns([count]);
    final result = query.map((e) => e.read(count)).getSingle();
    return result;
  }

//
  Future deleteShops(List<int> deletedId) =>
      (delete(posLocTable)..where((tbl) => tbl.id.isIn(deletedId))).go();

  Stream<List<PosLocTableData>> watchAllLimit({int limit = 0}) {
    final query = select(posLocTable);
    if (limit != 0) query..limit(limit);
    return query.watch();
  }

//
  Stream<List<PosLocTableData>> watchAll() => (select(posLocTable)).watch();

  Stream<PosLocTableData> watchAllById(int? id) =>
      (select(posLocTable)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Future<PosLocTableData?> getById(int? id) =>
      (select(posLocTable)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();
}
