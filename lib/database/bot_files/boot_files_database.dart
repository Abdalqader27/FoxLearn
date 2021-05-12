import 'package:foxlearn/database/bot_files/tables/file_table.dart';
import 'package:foxlearn/database/bot_files/tables/folder_table.dart';
import 'package:foxlearn/database/bot_files/tables/purchases_table.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'boot_files_database.g.dart';

@UseMoor(tables: [Files, Folders, Purchases], daos: [FoldersDao, FilesDao, PurchasesDao])
class BotDatabase extends _$BotDatabase {
  BotDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          logStatements: true,
          path: 'db.bot_files',
        )));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

@UseDao(tables: [Folders])
class FoldersDao extends DatabaseAccessor<BotDatabase> with _$FoldersDaoMixin {
  final BotDatabase db;

  FoldersDao(this.db) : super(db);

  Future insertFolder(Insertable<Folder> folder) => into(folders).insert(folder);

  Future<Folder?> getUFolder(int uId) =>
      (select(folders)..where((tbl) => tbl.id.equals(uId))).get().then((value) {
        if (value.isNotEmpty) return value.first;
        return null;
      });

  Future removeFolders() => delete(folders).go();

  Future removeUFolders(int uId) =>
      (delete(folders)..where((tbl) => tbl.universityId.equals(uId))).go();

  Future<List<Folder>> getSubFolder(int parentId) =>
      (select(folders)..where((tbl) => tbl.parentId.equals(parentId))).get();
}

@UseDao(tables: [Files])
class FilesDao extends DatabaseAccessor<BotDatabase> with _$FilesDaoMixin {
  final BotDatabase db;

  FilesDao(this.db) : super(db);

  Future removeFiles() => delete(files).go();

  Future insertFile(Insertable<File> file) => into(files).insert(file);

  Future removeUFiles(int uId) =>
      (delete(files)..where((tbl) => tbl.universityId.equals(uId))).go();

  Future<List<File>> getFolderFiles(int folderId) {
    return (select(files)..where((tbl) => tbl.folderId.equals(folderId))).get();
  }

  Future<int> getFilesCount() {
    return (select(files).get()).then((value) => value.length);
  }
}

@UseDao(tables: [Purchases])
class PurchasesDao extends DatabaseAccessor<BotDatabase> with _$PurchasesDaoMixin {
  final BotDatabase db;

  PurchasesDao(this.db) : super(db);

  Future<bool> isPurchase(String objectId) =>
      (select(purchases)..where((tbl) => tbl.objectId.equals(objectId)))
          .get()
          .then((value) => value.length != 0);

  Future<void> addPurchase(Insertable<Purchase> purchase) => into(purchases).insert(purchase);
}
