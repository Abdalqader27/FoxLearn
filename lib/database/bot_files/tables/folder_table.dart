import 'package:moor/moor.dart';

class Folders extends Table {
  @JsonKey(FolderKeys.FOLDER_ID_KEY)
  IntColumn get id => integer()();

  @JsonKey(FolderKeys.NAME_KEY)
  TextColumn get name => text()();

  @JsonKey(FolderKeys.PARENT_ID_KEY)
  IntColumn get parentId => integer()();

  @JsonKey(FolderKeys.HAS_FILES_KEY)
  BoolColumn get hasFiles => boolean()();

  @JsonKey(FolderKeys.UNIVERSITY_ID_KEY)
  IntColumn get universityId => integer()();
}

class FolderKeys {
  static const FOLDER_ID_KEY = 'ID';

  static const NAME_KEY = 'Name';

  static const PARENT_ID_KEY = 'ParentId';

  static const HAS_FILES_KEY = 'HasFiles';

  static const UNIVERSITY_ID_KEY = 'UniversityId';
}
