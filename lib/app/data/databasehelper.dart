/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-12 08:31:51
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-15 23:55:03
 */
import 'package:bluevoice/common/utils/utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'task.dart';

class DatabaseHelper {
  static final _databaseName = "task.db";
  static final _databaseVersion = 1;
  static final table = 'task';
  static final columnId = 'id';
  static final columnTaskName = 'taskname';
  static final columnTaskDetail = 'taskdetail';
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table ($columnId  INTEGER PRIMARY KEY AUTOINCREMENT, $columnTaskName TEXT, $columnTaskDetail TEXT)');
  }

  Future<int> insert(TaskItem task) async {
    Database? db = await instance.database;
    var res = await db!.insert(table, task.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    var res = await db!.query(table, orderBy: "$columnId DESC");
    return res;
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> clearTable() async {
    Database? db = await instance.database;
    await db!.rawQuery("DELETE FROM $table");
  }
}
