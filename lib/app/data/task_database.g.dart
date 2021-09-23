// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int? id;
  final String title;
  final int? completeDate;
  final String? content;
  final String? completeDateStr;
  final String? dateStr;
  Task(
      {this.id,
      required this.title,
      this.completeDate,
      this.content,
      this.completeDateStr,
      this.dateStr});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      completeDate: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}complete_date']),
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content']),
      completeDateStr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}complete_date_str']),
      dateStr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_str']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || completeDate != null) {
      map['complete_date'] = Variable<int?>(completeDate);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String?>(content);
    }
    if (!nullToAbsent || completeDateStr != null) {
      map['complete_date_str'] = Variable<String?>(completeDateStr);
    }
    if (!nullToAbsent || dateStr != null) {
      map['date_str'] = Variable<String?>(dateStr);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      completeDate: completeDate == null && nullToAbsent
          ? const Value.absent()
          : Value(completeDate),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      completeDateStr: completeDateStr == null && nullToAbsent
          ? const Value.absent()
          : Value(completeDateStr),
      dateStr: dateStr == null && nullToAbsent
          ? const Value.absent()
          : Value(dateStr),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      completeDate: serializer.fromJson<int?>(json['completeDate']),
      content: serializer.fromJson<String?>(json['content']),
      completeDateStr: serializer.fromJson<String?>(json['completeDateStr']),
      dateStr: serializer.fromJson<String?>(json['dateStr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'completeDate': serializer.toJson<int?>(completeDate),
      'content': serializer.toJson<String?>(content),
      'completeDateStr': serializer.toJson<String?>(completeDateStr),
      'dateStr': serializer.toJson<String?>(dateStr),
    };
  }

  Task copyWith(
          {int? id,
          String? title,
          int? completeDate,
          String? content,
          String? completeDateStr,
          String? dateStr}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        completeDate: completeDate ?? this.completeDate,
        content: content ?? this.content,
        completeDateStr: completeDateStr ?? this.completeDateStr,
        dateStr: dateStr ?? this.dateStr,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completeDate: $completeDate, ')
          ..write('content: $content, ')
          ..write('completeDateStr: $completeDateStr, ')
          ..write('dateStr: $dateStr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              completeDate.hashCode,
              $mrjc(content.hashCode,
                  $mrjc(completeDateStr.hashCode, dateStr.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.completeDate == this.completeDate &&
          other.content == this.content &&
          other.completeDateStr == this.completeDateStr &&
          other.dateStr == this.dateStr);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int?> id;
  final Value<String> title;
  final Value<int?> completeDate;
  final Value<String?> content;
  final Value<String?> completeDateStr;
  final Value<String?> dateStr;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.completeDate = const Value.absent(),
    this.content = const Value.absent(),
    this.completeDateStr = const Value.absent(),
    this.dateStr = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.completeDate = const Value.absent(),
    this.content = const Value.absent(),
    this.completeDateStr = const Value.absent(),
    this.dateStr = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Task> custom({
    Expression<int?>? id,
    Expression<String>? title,
    Expression<int?>? completeDate,
    Expression<String?>? content,
    Expression<String?>? completeDateStr,
    Expression<String?>? dateStr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (completeDate != null) 'complete_date': completeDate,
      if (content != null) 'content': content,
      if (completeDateStr != null) 'complete_date_str': completeDateStr,
      if (dateStr != null) 'date_str': dateStr,
    });
  }

  TasksCompanion copyWith(
      {Value<int?>? id,
      Value<String>? title,
      Value<int?>? completeDate,
      Value<String?>? content,
      Value<String?>? completeDateStr,
      Value<String?>? dateStr}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      completeDate: completeDate ?? this.completeDate,
      content: content ?? this.content,
      completeDateStr: completeDateStr ?? this.completeDateStr,
      dateStr: dateStr ?? this.dateStr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (completeDate.present) {
      map['complete_date'] = Variable<int?>(completeDate.value);
    }
    if (content.present) {
      map['content'] = Variable<String?>(content.value);
    }
    if (completeDateStr.present) {
      map['complete_date_str'] = Variable<String?>(completeDateStr.value);
    }
    if (dateStr.present) {
      map['date_str'] = Variable<String?>(dateStr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completeDate: $completeDate, ')
          ..write('content: $content, ')
          ..write('completeDateStr: $completeDateStr, ')
          ..write('dateStr: $dateStr')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _completeDateMeta =
      const VerificationMeta('completeDate');
  late final GeneratedColumn<int?> completeDate = GeneratedColumn<int?>(
      'complete_date', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _completeDateStrMeta =
      const VerificationMeta('completeDateStr');
  late final GeneratedColumn<String?> completeDateStr =
      GeneratedColumn<String?>('complete_date_str', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _dateStrMeta = const VerificationMeta('dateStr');
  late final GeneratedColumn<String?> dateStr = GeneratedColumn<String?>(
      'date_str', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now().format());
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, completeDate, content, completeDateStr, dateStr];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('complete_date')) {
      context.handle(
          _completeDateMeta,
          completeDate.isAcceptableOrUnknown(
              data['complete_date']!, _completeDateMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('complete_date_str')) {
      context.handle(
          _completeDateStrMeta,
          completeDateStr.isAcceptableOrUnknown(
              data['complete_date_str']!, _completeDateStrMeta));
    }
    if (data.containsKey('date_str')) {
      context.handle(_dateStrMeta,
          dateStr.isAcceptableOrUnknown(data['date_str']!, _dateStrMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Task.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$TaskDatabase extends GeneratedDatabase {
  _$TaskDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TasksTable tasks = $TasksTable(this);
  late final TaskDao taskDao = TaskDao(this as TaskDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
