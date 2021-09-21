// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int completeDate;
  final String? completeDateStr;
  final String? content;
  final String? dateStr;
  final int? id;
  final int? priority;
  final int? status;
  final String title;
  final int type;
  final int? userId;
  Task(
      {required this.completeDate,
      this.completeDateStr,
      this.content,
      this.dateStr,
      this.id,
      this.priority,
      this.status,
      required this.title,
      required this.type,
      this.userId});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      completeDate: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}complete_date'])!,
      completeDateStr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}complete_date_str']),
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content']),
      dateStr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_str']),
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      priority: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}priority']),
      status: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['complete_date'] = Variable<int>(completeDate);
    if (!nullToAbsent || completeDateStr != null) {
      map['complete_date_str'] = Variable<String?>(completeDateStr);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String?>(content);
    }
    if (!nullToAbsent || dateStr != null) {
      map['date_str'] = Variable<String?>(dateStr);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<int?>(priority);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int?>(status);
    }
    map['title'] = Variable<String>(title);
    map['type'] = Variable<int>(type);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int?>(userId);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      completeDate: Value(completeDate),
      completeDateStr: completeDateStr == null && nullToAbsent
          ? const Value.absent()
          : Value(completeDateStr),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      dateStr: dateStr == null && nullToAbsent
          ? const Value.absent()
          : Value(dateStr),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      title: Value(title),
      type: Value(type),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      completeDate: serializer.fromJson<int>(json['completeDate']),
      completeDateStr: serializer.fromJson<String?>(json['completeDateStr']),
      content: serializer.fromJson<String?>(json['content']),
      dateStr: serializer.fromJson<String?>(json['dateStr']),
      id: serializer.fromJson<int?>(json['id']),
      priority: serializer.fromJson<int?>(json['priority']),
      status: serializer.fromJson<int?>(json['status']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<int>(json['type']),
      userId: serializer.fromJson<int?>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'completeDate': serializer.toJson<int>(completeDate),
      'completeDateStr': serializer.toJson<String?>(completeDateStr),
      'content': serializer.toJson<String?>(content),
      'dateStr': serializer.toJson<String?>(dateStr),
      'id': serializer.toJson<int?>(id),
      'priority': serializer.toJson<int?>(priority),
      'status': serializer.toJson<int?>(status),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<int>(type),
      'userId': serializer.toJson<int?>(userId),
    };
  }

  Task copyWith(
          {int? completeDate,
          String? completeDateStr,
          String? content,
          String? dateStr,
          int? id,
          int? priority,
          int? status,
          String? title,
          int? type,
          int? userId}) =>
      Task(
        completeDate: completeDate ?? this.completeDate,
        completeDateStr: completeDateStr ?? this.completeDateStr,
        content: content ?? this.content,
        dateStr: dateStr ?? this.dateStr,
        id: id ?? this.id,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        title: title ?? this.title,
        type: type ?? this.type,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('completeDate: $completeDate, ')
          ..write('completeDateStr: $completeDateStr, ')
          ..write('content: $content, ')
          ..write('dateStr: $dateStr, ')
          ..write('id: $id, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      completeDate.hashCode,
      $mrjc(
          completeDateStr.hashCode,
          $mrjc(
              content.hashCode,
              $mrjc(
                  dateStr.hashCode,
                  $mrjc(
                      id.hashCode,
                      $mrjc(
                          priority.hashCode,
                          $mrjc(
                              status.hashCode,
                              $mrjc(
                                  title.hashCode,
                                  $mrjc(
                                      type.hashCode, userId.hashCode))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.completeDate == this.completeDate &&
          other.completeDateStr == this.completeDateStr &&
          other.content == this.content &&
          other.dateStr == this.dateStr &&
          other.id == this.id &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.title == this.title &&
          other.type == this.type &&
          other.userId == this.userId);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> completeDate;
  final Value<String?> completeDateStr;
  final Value<String?> content;
  final Value<String?> dateStr;
  final Value<int?> id;
  final Value<int?> priority;
  final Value<int?> status;
  final Value<String> title;
  final Value<int> type;
  final Value<int?> userId;
  const TasksCompanion({
    this.completeDate = const Value.absent(),
    this.completeDateStr = const Value.absent(),
    this.content = const Value.absent(),
    this.dateStr = const Value.absent(),
    this.id = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.userId = const Value.absent(),
  });
  TasksCompanion.insert({
    required int completeDate,
    this.completeDateStr = const Value.absent(),
    this.content = const Value.absent(),
    this.dateStr = const Value.absent(),
    this.id = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    required String title,
    this.type = const Value.absent(),
    this.userId = const Value.absent(),
  })  : completeDate = Value(completeDate),
        title = Value(title);
  static Insertable<Task> custom({
    Expression<int>? completeDate,
    Expression<String?>? completeDateStr,
    Expression<String?>? content,
    Expression<String?>? dateStr,
    Expression<int?>? id,
    Expression<int?>? priority,
    Expression<int?>? status,
    Expression<String>? title,
    Expression<int>? type,
    Expression<int?>? userId,
  }) {
    return RawValuesInsertable({
      if (completeDate != null) 'complete_date': completeDate,
      if (completeDateStr != null) 'complete_date_str': completeDateStr,
      if (content != null) 'content': content,
      if (dateStr != null) 'date_str': dateStr,
      if (id != null) 'id': id,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (userId != null) 'user_id': userId,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? completeDate,
      Value<String?>? completeDateStr,
      Value<String?>? content,
      Value<String?>? dateStr,
      Value<int?>? id,
      Value<int?>? priority,
      Value<int?>? status,
      Value<String>? title,
      Value<int>? type,
      Value<int?>? userId}) {
    return TasksCompanion(
      completeDate: completeDate ?? this.completeDate,
      completeDateStr: completeDateStr ?? this.completeDateStr,
      content: content ?? this.content,
      dateStr: dateStr ?? this.dateStr,
      id: id ?? this.id,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      title: title ?? this.title,
      type: type ?? this.type,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (completeDate.present) {
      map['complete_date'] = Variable<int>(completeDate.value);
    }
    if (completeDateStr.present) {
      map['complete_date_str'] = Variable<String?>(completeDateStr.value);
    }
    if (content.present) {
      map['content'] = Variable<String?>(content.value);
    }
    if (dateStr.present) {
      map['date_str'] = Variable<String?>(dateStr.value);
    }
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int?>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<int?>(status.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int?>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('completeDate: $completeDate, ')
          ..write('completeDateStr: $completeDateStr, ')
          ..write('content: $content, ')
          ..write('dateStr: $dateStr, ')
          ..write('id: $id, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _completeDateMeta =
      const VerificationMeta('completeDate');
  late final GeneratedColumn<int?> completeDate = GeneratedColumn<int?>(
      'complete_date', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _completeDateStrMeta =
      const VerificationMeta('completeDateStr');
  late final GeneratedColumn<String?> completeDateStr =
      GeneratedColumn<String?>('complete_date_str', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _dateStrMeta = const VerificationMeta('dateStr');
  late final GeneratedColumn<String?> dateStr = GeneratedColumn<String?>(
      'date_str', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now().format());
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  late final GeneratedColumn<int?> priority = GeneratedColumn<int?>(
      'priority', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<int?> status = GeneratedColumn<int?>(
      'status', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<int?> type = GeneratedColumn<int?>(
      'type', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        completeDate,
        completeDateStr,
        content,
        dateStr,
        id,
        priority,
        status,
        title,
        type,
        userId
      ];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('complete_date')) {
      context.handle(
          _completeDateMeta,
          completeDate.isAcceptableOrUnknown(
              data['complete_date']!, _completeDateMeta));
    } else if (isInserting) {
      context.missing(_completeDateMeta);
    }
    if (data.containsKey('complete_date_str')) {
      context.handle(
          _completeDateStrMeta,
          completeDateStr.isAcceptableOrUnknown(
              data['complete_date_str']!, _completeDateStrMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('date_str')) {
      context.handle(_dateStrMeta,
          dateStr.isAcceptableOrUnknown(data['date_str']!, _dateStrMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {completeDate, id};
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
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
