// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// ignore_for_file: type=lint
class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ModelTodoType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ModelTodoType>($TodosTable.$convertertype);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, type, startTime, title, content];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: $TodosTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ModelTodoType, String, String> $convertertype =
      const EnumNameConverter<ModelTodoType>(ModelTodoType.values);
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final ModelTodoType type;
  final DateTime startTime;
  final String title;
  final String content;
  const Todo(
      {required this.id,
      required this.type,
      required this.startTime,
      required this.title,
      required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      final converter = $TodosTable.$convertertype;
      map['type'] = Variable<String>(converter.toSql(type));
    }
    map['start_time'] = Variable<DateTime>(startTime);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      type: Value(type),
      startTime: Value(startTime),
      title: Value(title),
      content: Value(content),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      type: $TodosTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type':
          serializer.toJson<String>($TodosTable.$convertertype.toJson(type)),
      'startTime': serializer.toJson<DateTime>(startTime),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
    };
  }

  Todo copyWith(
          {int? id,
          ModelTodoType? type,
          DateTime? startTime,
          String? title,
          String? content}) =>
      Todo(
        id: id ?? this.id,
        type: type ?? this.type,
        startTime: startTime ?? this.startTime,
        title: title ?? this.title,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startTime: $startTime, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, startTime, title, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.type == this.type &&
          other.startTime == this.startTime &&
          other.title == this.title &&
          other.content == this.content);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<ModelTodoType> type;
  final Value<DateTime> startTime;
  final Value<String> title;
  final Value<String> content;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.startTime = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required ModelTodoType type,
    required DateTime startTime,
    required String title,
    required String content,
  })  : type = Value(type),
        startTime = Value(startTime),
        title = Value(title),
        content = Value(content);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<DateTime>? startTime,
    Expression<String>? title,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (startTime != null) 'start_time': startTime,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<ModelTodoType>? type,
      Value<DateTime>? startTime,
      Value<String>? title,
      Value<String>? content}) {
    return TodosCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      final converter = $TodosTable.$convertertype;
      map['type'] = Variable<String>(converter.toSql(type.value));
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startTime: $startTime, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $DailyGroupsTable extends DailyGroups
    with TableInfo<$DailyGroupsTable, DailyGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'daily_groups';
  @override
  String get actualTableName => 'daily_groups';
  @override
  VerificationContext validateIntegrity(Insertable<DailyGroup> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $DailyGroupsTable createAlias(String alias) {
    return $DailyGroupsTable(attachedDatabase, alias);
  }
}

class DailyGroup extends DataClass implements Insertable<DailyGroup> {
  final int id;
  final String name;
  const DailyGroup({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DailyGroupsCompanion toCompanion(bool nullToAbsent) {
    return DailyGroupsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory DailyGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyGroup(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  DailyGroup copyWith({int? id, String? name}) => DailyGroup(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('DailyGroup(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyGroup && other.id == this.id && other.name == this.name);
}

class DailyGroupsCompanion extends UpdateCompanion<DailyGroup> {
  final Value<int> id;
  final Value<String> name;
  const DailyGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DailyGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DailyGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DailyGroupsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DailyGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $DailiesTable extends Dailies with TableInfo<$DailiesTable, Dailie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted =
      GeneratedColumn<bool>('is_completed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_completed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<int> group = GeneratedColumn<int>(
      'group', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES daily_groups (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, isCompleted, group];
  @override
  String get aliasedName => _alias ?? 'dailies';
  @override
  String get actualTableName => 'dailies';
  @override
  VerificationContext validateIntegrity(Insertable<Dailie> instance,
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
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('group')) {
      context.handle(
          _groupMeta, group.isAcceptableOrUnknown(data['group']!, _groupMeta));
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dailie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dailie(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group'])!,
    );
  }

  @override
  $DailiesTable createAlias(String alias) {
    return $DailiesTable(attachedDatabase, alias);
  }
}

class Dailie extends DataClass implements Insertable<Dailie> {
  final int id;
  final String name;
  final bool isCompleted;
  final int group;
  const Dailie(
      {required this.id,
      required this.name,
      required this.isCompleted,
      required this.group});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['group'] = Variable<int>(group);
    return map;
  }

  DailiesCompanion toCompanion(bool nullToAbsent) {
    return DailiesCompanion(
      id: Value(id),
      name: Value(name),
      isCompleted: Value(isCompleted),
      group: Value(group),
    );
  }

  factory Dailie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dailie(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      group: serializer.fromJson<int>(json['group']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'group': serializer.toJson<int>(group),
    };
  }

  Dailie copyWith({int? id, String? name, bool? isCompleted, int? group}) =>
      Dailie(
        id: id ?? this.id,
        name: name ?? this.name,
        isCompleted: isCompleted ?? this.isCompleted,
        group: group ?? this.group,
      );
  @override
  String toString() {
    return (StringBuffer('Dailie(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('group: $group')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isCompleted, group);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dailie &&
          other.id == this.id &&
          other.name == this.name &&
          other.isCompleted == this.isCompleted &&
          other.group == this.group);
}

class DailiesCompanion extends UpdateCompanion<Dailie> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isCompleted;
  final Value<int> group;
  const DailiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.group = const Value.absent(),
  });
  DailiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool isCompleted,
    required int group,
  })  : name = Value(name),
        isCompleted = Value(isCompleted),
        group = Value(group);
  static Insertable<Dailie> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isCompleted,
    Expression<int>? group,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (group != null) 'group': group,
    });
  }

  DailiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? isCompleted,
      Value<int>? group}) {
    return DailiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      group: group ?? this.group,
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
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (group.present) {
      map['group'] = Variable<int>(group.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('group: $group')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TodosTable todos = $TodosTable(this);
  late final $DailyGroupsTable dailyGroups = $DailyGroupsTable(this);
  late final $DailiesTable dailies = $DailiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [todos, dailyGroups, dailies];
}
