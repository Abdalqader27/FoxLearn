// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PosLocTableData extends DataClass implements Insertable<PosLocTableData> {
  final int id;
  final String name;
  final String? lag;
  final String? lat;
  PosLocTableData({required this.id, required this.name, this.lag, this.lat});
  factory PosLocTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return PosLocTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      lag: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lag']),
      lat: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || lag != null) {
      map['lag'] = Variable<String?>(lag);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<String?>(lat);
    }
    return map;
  }

  PosLocTableCompanion toCompanion(bool nullToAbsent) {
    return PosLocTableCompanion(
      id: Value(id),
      name: Value(name),
      lag: lag == null && nullToAbsent ? const Value.absent() : Value(lag),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
    );
  }

  factory PosLocTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PosLocTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lag: serializer.fromJson<String?>(json['lag']),
      lat: serializer.fromJson<String?>(json['lat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lag': serializer.toJson<String?>(lag),
      'lat': serializer.toJson<String?>(lat),
    };
  }

  PosLocTableData copyWith({int? id, String? name, String? lag, String? lat}) =>
      PosLocTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        lag: lag ?? this.lag,
        lat: lat ?? this.lat,
      );
  @override
  String toString() {
    return (StringBuffer('PosLocTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lag: $lag, ')
          ..write('lat: $lat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(name.hashCode, $mrjc(lag.hashCode, lat.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PosLocTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.lag == this.lag &&
          other.lat == this.lat);
}

class PosLocTableCompanion extends UpdateCompanion<PosLocTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> lag;
  final Value<String?> lat;
  const PosLocTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lag = const Value.absent(),
    this.lat = const Value.absent(),
  });
  PosLocTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.lag = const Value.absent(),
    this.lat = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PosLocTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String?>? lag,
    Expression<String?>? lat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lag != null) 'lag': lag,
      if (lat != null) 'lat': lat,
    });
  }

  PosLocTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? lag,
      Value<String?>? lat}) {
    return PosLocTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lag: lag ?? this.lag,
      lat: lat ?? this.lat,
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
    if (lag.present) {
      map['lag'] = Variable<String?>(lag.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String?>(lat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PosLocTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lag: $lag, ')
          ..write('lat: $lat')
          ..write(')'))
        .toString();
  }
}

class $PosLocTableTable extends PosLocTable
    with TableInfo<$PosLocTableTable, PosLocTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PosLocTableTable(this._db, [this._alias]);
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

  final VerificationMeta _lagMeta = const VerificationMeta('lag');
  @override
  late final GeneratedTextColumn lag = _constructLag();
  GeneratedTextColumn _constructLag() {
    return GeneratedTextColumn(
      'lag',
      $tableName,
      true,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedTextColumn lat = _constructLat();
  GeneratedTextColumn _constructLat() {
    return GeneratedTextColumn(
      'lat',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, lag, lat];
  @override
  $PosLocTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'pos_loc_table';
  @override
  final String actualTableName = 'pos_loc_table';
  @override
  VerificationContext validateIntegrity(Insertable<PosLocTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lag')) {
      context.handle(
          _lagMeta, lag.isAcceptableOrUnknown(data['lag']!, _lagMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PosLocTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PosLocTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PosLocTableTable createAlias(String alias) {
    return $PosLocTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PosLocTableTable posLocTable = $PosLocTableTable(this);
  late final PosLocDao posLocDao = PosLocDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [posLocTable];
}
