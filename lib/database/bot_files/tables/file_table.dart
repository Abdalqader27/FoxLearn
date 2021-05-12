import 'package:moor/moor.dart';

class Files extends Table {
  @JsonKey(FileKeys.FOLDER_ID_KEY)
  IntColumn get folderId => integer()();

  @JsonKey(FileKeys.NAME_KEY)
  TextColumn get name => text()();

  @JsonKey(FileKeys.MY_FILE_KEY)
  TextColumn get myFile => text()();

  @JsonKey(FileKeys.UNIVERSITY_ID_KEY)
  IntColumn get universityId => integer()();

  @JsonKey(FileKeys.OBJECT_ID_KEY)
  TextColumn get objectId => text()();

  @JsonKey(FileKeys.IS_ACTIVATED_KEY)
  BoolColumn get isActivated => boolean()();

  @JsonKey(FileKeys.CREATED_AT_KEY)
  TextColumn get createdAt => text()();
}

class FileKeys {
  static const FOLDER_ID_KEY = 'FolderId';

  static const NAME_KEY = 'FileName';

  static const MY_FILE_KEY = 'MyFile';

  static const UNIVERSITY_ID_KEY = 'UniversityId';

  static const OBJECT_ID_KEY = 'objectId';

  static const IS_ACTIVATED_KEY = 'IsActivated';

  static const CREATED_AT_KEY = 'createdAt';
}

class MyFile {
  MyFile({
    required this.type,
    required this.name,
    required this.url,
  });

  String type;
  String name;
  String url;

  MyFile copyWith({
    required String type,
    required String name,
    required String url,
  }) =>
      MyFile(
        type: type ?? this.type,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory MyFile.fromJson(Map<String, dynamic> json) => MyFile(
        type: json["__type"] == null ? null : json["__type"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type == null ? null : type,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}
