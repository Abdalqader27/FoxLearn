// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boot_files_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class File extends DataClass implements Insertable<File> {
  final int folderId;
  final String name;
  final String myFile;
  final int universityId;
  final String objectId;
  final bool isActivated;
  final String createdAt;
  File(
      {required this.folderId,
      required this.name,
      required this.myFile,
      required this.universityId,
      required this.objectId,
      required this.isActivated,
      required this.createdAt});
  factory File.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return File(
      folderId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}folder_id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      myFile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}my_file'])!,
      universityId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}university_id'])!,
      objectId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      isActivated: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_activated'])!,
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['folder_id'] = Variable<int>(folderId);
    map['name'] = Variable<String>(name);
    map['my_file'] = Variable<String>(myFile);
    map['university_id'] = Variable<int>(universityId);
    map['object_id'] = Variable<String>(objectId);
    map['is_activated'] = Variable<bool>(isActivated);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  FilesCompanion toCompanion(bool nullToAbsent) {
    return FilesCompanion(
      folderId: Value(folderId),
      name: Value(name),
      myFile: Value(myFile),
      universityId: Value(universityId),
      objectId: Value(objectId),
      isActivated: Value(isActivated),
      createdAt: Value(createdAt),
    );
  }

  factory File.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return File(
      folderId: serializer.fromJson<int>(json['FolderId']),
      name: serializer.fromJson<String>(json['FileName']),
      myFile: serializer.fromJson<String>(json['MyFile']),
      universityId: serializer.fromJson<int>(json['UniversityId']),
      objectId: serializer.fromJson<String>(json['objectId']),
      isActivated: serializer.fromJson<bool>(json['IsActivated']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'FolderId': serializer.toJson<int>(folderId),
      'FileName': serializer.toJson<String>(name),
      'MyFile': serializer.toJson<String>(myFile),
      'UniversityId': serializer.toJson<int>(universityId),
      'objectId': serializer.toJson<String>(objectId),
      'IsActivated': serializer.toJson<bool>(isActivated),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  File copyWith(
          {int? folderId,
          String? name,
          String? myFile,
          int? universityId,
          String? objectId,
          bool? isActivated,
          String? createdAt}) =>
      File(
        folderId: folderId ?? this.folderId,
        name: name ?? this.name,
        myFile: myFile ?? this.myFile,
        universityId: universityId ?? this.universityId,
        objectId: objectId ?? this.objectId,
        isActivated: isActivated ?? this.isActivated,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('File(')
          ..write('folderId: $folderId, ')
          ..write('name: $name, ')
          ..write('myFile: $myFile, ')
          ..write('universityId: $universityId, ')
          ..write('objectId: $objectId, ')
          ..write('isActivated: $isActivated, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      folderId.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              myFile.hashCode,
              $mrjc(
                  universityId.hashCode,
                  $mrjc(objectId.hashCode,
                      $mrjc(isActivated.hashCode, createdAt.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is File &&
          other.folderId == this.folderId &&
          other.name == this.name &&
          other.myFile == this.myFile &&
          other.universityId == this.universityId &&
          other.objectId == this.objectId &&
          other.isActivated == this.isActivated &&
          other.createdAt == this.createdAt);
}

class FilesCompanion extends UpdateCompanion<File> {
  final Value<int> folderId;
  final Value<String> name;
  final Value<String> myFile;
  final Value<int> universityId;
  final Value<String> objectId;
  final Value<bool> isActivated;
  final Value<String> createdAt;
  const FilesCompanion({
    this.folderId = const Value.absent(),
    this.name = const Value.absent(),
    this.myFile = const Value.absent(),
    this.universityId = const Value.absent(),
    this.objectId = const Value.absent(),
    this.isActivated = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FilesCompanion.insert({
    required int folderId,
    required String name,
    required String myFile,
    required int universityId,
    required String objectId,
    required bool isActivated,
    required String createdAt,
  })   : folderId = Value(folderId),
        name = Value(name),
        myFile = Value(myFile),
        universityId = Value(universityId),
        objectId = Value(objectId),
        isActivated = Value(isActivated),
        createdAt = Value(createdAt);
  static Insertable<File> custom({
    Expression<int>? folderId,
    Expression<String>? name,
    Expression<String>? myFile,
    Expression<int>? universityId,
    Expression<String>? objectId,
    Expression<bool>? isActivated,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (folderId != null) 'folder_id': folderId,
      if (name != null) 'name': name,
      if (myFile != null) 'my_file': myFile,
      if (universityId != null) 'university_id': universityId,
      if (objectId != null) 'object_id': objectId,
      if (isActivated != null) 'is_activated': isActivated,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FilesCompanion copyWith(
      {Value<int>? folderId,
      Value<String>? name,
      Value<String>? myFile,
      Value<int>? universityId,
      Value<String>? objectId,
      Value<bool>? isActivated,
      Value<String>? createdAt}) {
    return FilesCompanion(
      folderId: folderId ?? this.folderId,
      name: name ?? this.name,
      myFile: myFile ?? this.myFile,
      universityId: universityId ?? this.universityId,
      objectId: objectId ?? this.objectId,
      isActivated: isActivated ?? this.isActivated,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (folderId.present) {
      map['folder_id'] = Variable<int>(folderId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (myFile.present) {
      map['my_file'] = Variable<String>(myFile.value);
    }
    if (universityId.present) {
      map['university_id'] = Variable<int>(universityId.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (isActivated.present) {
      map['is_activated'] = Variable<bool>(isActivated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilesCompanion(')
          ..write('folderId: $folderId, ')
          ..write('name: $name, ')
          ..write('myFile: $myFile, ')
          ..write('universityId: $universityId, ')
          ..write('objectId: $objectId, ')
          ..write('isActivated: $isActivated, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FilesTable extends Files with TableInfo<$FilesTable, File> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FilesTable(this._db, [this._alias]);
  final VerificationMeta _folderIdMeta = const VerificationMeta('folderId');
  @override
  late final GeneratedIntColumn folderId = _constructFolderId();
  GeneratedIntColumn _constructFolderId() {
    return GeneratedIntColumn(
      'folder_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _myFileMeta = const VerificationMeta('myFile');
  @override
  late final GeneratedTextColumn myFile = _constructMyFile();
  GeneratedTextColumn _constructMyFile() {
    return GeneratedTextColumn(
      'my_file',
      $tableName,
      false,
    );
  }

  final VerificationMeta _universityIdMeta =
      const VerificationMeta('universityId');
  @override
  late final GeneratedIntColumn universityId = _constructUniversityId();
  GeneratedIntColumn _constructUniversityId() {
    return GeneratedIntColumn(
      'university_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedTextColumn objectId = _constructObjectId();
  GeneratedTextColumn _constructObjectId() {
    return GeneratedTextColumn(
      'object_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isActivatedMeta =
      const VerificationMeta('isActivated');
  @override
  late final GeneratedBoolColumn isActivated = _constructIsActivated();
  GeneratedBoolColumn _constructIsActivated() {
    return GeneratedBoolColumn(
      'is_activated',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedTextColumn createdAt = _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [folderId, name, myFile, universityId, objectId, isActivated, createdAt];
  @override
  $FilesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'files';
  @override
  final String actualTableName = 'files';
  @override
  VerificationContext validateIntegrity(Insertable<File> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('folder_id')) {
      context.handle(_folderIdMeta,
          folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta));
    } else if (isInserting) {
      context.missing(_folderIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('my_file')) {
      context.handle(_myFileMeta,
          myFile.isAcceptableOrUnknown(data['my_file']!, _myFileMeta));
    } else if (isInserting) {
      context.missing(_myFileMeta);
    }
    if (data.containsKey('university_id')) {
      context.handle(
          _universityIdMeta,
          universityId.isAcceptableOrUnknown(
              data['university_id']!, _universityIdMeta));
    } else if (isInserting) {
      context.missing(_universityIdMeta);
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('is_activated')) {
      context.handle(
          _isActivatedMeta,
          isActivated.isAcceptableOrUnknown(
              data['is_activated']!, _isActivatedMeta));
    } else if (isInserting) {
      context.missing(_isActivatedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  File map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return File.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FilesTable createAlias(String alias) {
    return $FilesTable(_db, alias);
  }
}

class Folder extends DataClass implements Insertable<Folder> {
  final int id;
  final String name;
  final int parentId;
  final bool hasFiles;
  final int universityId;
  Folder(
      {required this.id,
      required this.name,
      required this.parentId,
      required this.hasFiles,
      required this.universityId});
  factory Folder.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Folder(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      parentId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}parent_id'])!,
      hasFiles: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}has_files'])!,
      universityId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}university_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['parent_id'] = Variable<int>(parentId);
    map['has_files'] = Variable<bool>(hasFiles);
    map['university_id'] = Variable<int>(universityId);
    return map;
  }

  FoldersCompanion toCompanion(bool nullToAbsent) {
    return FoldersCompanion(
      id: Value(id),
      name: Value(name),
      parentId: Value(parentId),
      hasFiles: Value(hasFiles),
      universityId: Value(universityId),
    );
  }

  factory Folder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Folder(
      id: serializer.fromJson<int>(json['ID']),
      name: serializer.fromJson<String>(json['Name']),
      parentId: serializer.fromJson<int>(json['ParentId']),
      hasFiles: serializer.fromJson<bool>(json['HasFiles']),
      universityId: serializer.fromJson<int>(json['UniversityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ID': serializer.toJson<int>(id),
      'Name': serializer.toJson<String>(name),
      'ParentId': serializer.toJson<int>(parentId),
      'HasFiles': serializer.toJson<bool>(hasFiles),
      'UniversityId': serializer.toJson<int>(universityId),
    };
  }

  Folder copyWith(
          {int? id,
          String? name,
          int? parentId,
          bool? hasFiles,
          int? universityId}) =>
      Folder(
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
        hasFiles: hasFiles ?? this.hasFiles,
        universityId: universityId ?? this.universityId,
      );
  @override
  String toString() {
    return (StringBuffer('Folder(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('hasFiles: $hasFiles, ')
          ..write('universityId: $universityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(parentId.hashCode,
              $mrjc(hasFiles.hashCode, universityId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Folder &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentId == this.parentId &&
          other.hasFiles == this.hasFiles &&
          other.universityId == this.universityId);
}

class FoldersCompanion extends UpdateCompanion<Folder> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> parentId;
  final Value<bool> hasFiles;
  final Value<int> universityId;
  const FoldersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
    this.hasFiles = const Value.absent(),
    this.universityId = const Value.absent(),
  });
  FoldersCompanion.insert({
    required int id,
    required String name,
    required int parentId,
    required bool hasFiles,
    required int universityId,
  })   : id = Value(id),
        name = Value(name),
        parentId = Value(parentId),
        hasFiles = Value(hasFiles),
        universityId = Value(universityId);
  static Insertable<Folder> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? parentId,
    Expression<bool>? hasFiles,
    Expression<int>? universityId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (parentId != null) 'parent_id': parentId,
      if (hasFiles != null) 'has_files': hasFiles,
      if (universityId != null) 'university_id': universityId,
    });
  }

  FoldersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? parentId,
      Value<bool>? hasFiles,
      Value<int>? universityId}) {
    return FoldersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      hasFiles: hasFiles ?? this.hasFiles,
      universityId: universityId ?? this.universityId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (hasFiles.present) {
      map['has_files'] = Variable<bool>(hasFiles.value);
    }
    if (universityId.present) {
      map['university_id'] = Variable<int>(universityId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoldersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('hasFiles: $hasFiles, ')
          ..write('universityId: $universityId')
          ..write(')'))
        .toString();
  }
}

class $FoldersTable extends Folders with TableInfo<$FoldersTable, Folder> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FoldersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  @override
  late final GeneratedIntColumn parentId = _constructParentId();
  GeneratedIntColumn _constructParentId() {
    return GeneratedIntColumn(
      'parent_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hasFilesMeta = const VerificationMeta('hasFiles');
  @override
  late final GeneratedBoolColumn hasFiles = _constructHasFiles();
  GeneratedBoolColumn _constructHasFiles() {
    return GeneratedBoolColumn(
      'has_files',
      $tableName,
      false,
    );
  }

  final VerificationMeta _universityIdMeta =
      const VerificationMeta('universityId');
  @override
  late final GeneratedIntColumn universityId = _constructUniversityId();
  GeneratedIntColumn _constructUniversityId() {
    return GeneratedIntColumn(
      'university_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, parentId, hasFiles, universityId];
  @override
  $FoldersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'folders';
  @override
  final String actualTableName = 'folders';
  @override
  VerificationContext validateIntegrity(Insertable<Folder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('has_files')) {
      context.handle(_hasFilesMeta,
          hasFiles.isAcceptableOrUnknown(data['has_files']!, _hasFilesMeta));
    } else if (isInserting) {
      context.missing(_hasFilesMeta);
    }
    if (data.containsKey('university_id')) {
      context.handle(
          _universityIdMeta,
          universityId.isAcceptableOrUnknown(
              data['university_id']!, _universityIdMeta));
    } else if (isInserting) {
      context.missing(_universityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Folder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Folder.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoldersTable createAlias(String alias) {
    return $FoldersTable(_db, alias);
  }
}

class Purchase extends DataClass implements Insertable<Purchase> {
  final String objectId;
  Purchase({required this.objectId});
  factory Purchase.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Purchase(
      objectId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    return map;
  }

  PurchasesCompanion toCompanion(bool nullToAbsent) {
    return PurchasesCompanion(
      objectId: Value(objectId),
    );
  }

  factory Purchase.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Purchase(
      objectId: serializer.fromJson<String>(json['objectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
    };
  }

  Purchase copyWith({String? objectId}) => Purchase(
        objectId: objectId ?? this.objectId,
      );
  @override
  String toString() {
    return (StringBuffer('Purchase(')..write('objectId: $objectId')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(objectId.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Purchase && other.objectId == this.objectId);
}

class PurchasesCompanion extends UpdateCompanion<Purchase> {
  final Value<String> objectId;
  const PurchasesCompanion({
    this.objectId = const Value.absent(),
  });
  PurchasesCompanion.insert({
    required String objectId,
  }) : objectId = Value(objectId);
  static Insertable<Purchase> custom({
    Expression<String>? objectId,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
    });
  }

  PurchasesCompanion copyWith({Value<String>? objectId}) {
    return PurchasesCompanion(
      objectId: objectId ?? this.objectId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchasesCompanion(')
          ..write('objectId: $objectId')
          ..write(')'))
        .toString();
  }
}

class $PurchasesTable extends Purchases
    with TableInfo<$PurchasesTable, Purchase> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PurchasesTable(this._db, [this._alias]);
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedTextColumn objectId = _constructObjectId();
  GeneratedTextColumn _constructObjectId() {
    return GeneratedTextColumn(
      'object_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [objectId];
  @override
  $PurchasesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'purchases';
  @override
  final String actualTableName = 'purchases';
  @override
  VerificationContext validateIntegrity(Insertable<Purchase> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Purchase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Purchase.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PurchasesTable createAlias(String alias) {
    return $PurchasesTable(_db, alias);
  }
}

abstract class _$BotDatabase extends GeneratedDatabase {
  _$BotDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FilesTable files = $FilesTable(this);
  late final $FoldersTable folders = $FoldersTable(this);
  late final $PurchasesTable purchases = $PurchasesTable(this);
  late final FoldersDao foldersDao = FoldersDao(this as BotDatabase);
  late final FilesDao filesDao = FilesDao(this as BotDatabase);
  late final PurchasesDao purchasesDao = PurchasesDao(this as BotDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [files, folders, purchases];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$FoldersDaoMixin on DatabaseAccessor<BotDatabase> {
  $FoldersTable get folders => attachedDatabase.folders;
}
mixin _$FilesDaoMixin on DatabaseAccessor<BotDatabase> {
  $FilesTable get files => attachedDatabase.files;
}
mixin _$PurchasesDaoMixin on DatabaseAccessor<BotDatabase> {
  $PurchasesTable get purchases => attachedDatabase.purchases;
}
