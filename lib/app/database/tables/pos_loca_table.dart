import 'package:moor_flutter/moor_flutter.dart';

class PosLocTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get lag => text().nullable()();

  TextColumn get lat => text().nullable()();

}
