/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-21 20:15:20
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 17:29:54
 */
import 'dart:io';

import 'package:bluevoice/app/data/task_dao.dart';
import 'package:bluevoice/common/utils/extension/date_extension.dart';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'task_database.g.dart';

// this will generate a table called "tasks" for us. The rows of that table will
// be represented by a class called "Task".
class Tasks extends Table {
  // 主键
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get title => text()();

  // 可空类型
  IntColumn get completeDate => integer().nullable()();
 
  TextColumn get content => text().nullable()();
  TextColumn get completeDateStr => text().nullable()();

  // 为空自动生成默认值
  TextColumn get dateStr =>
      text().nullable().clientDefault(() => DateTime.now().format())();

  
}

@UseMoor(tables: [Tasks], daos: [TaskDao])
class TaskDatabase extends _$TaskDatabase {
  // we tell the database where to store the data with this constructor
  TaskDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
