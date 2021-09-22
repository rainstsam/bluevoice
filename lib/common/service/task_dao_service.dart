/*
 * @Author: your name
 * @Date: 2020-12-11 00:05:19
 * @LastEditTime: 2021-09-22 10:50:36
 * @LastEditors: rainstsam
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/providers/task_dao_service.dart
 */

import 'package:get/get.dart';
import 'package:bluevoice/app/data/task_dao.dart';
import 'package:bluevoice/app/data/task_database.dart';

class TaskDaoController extends GetxService {
  TaskDao init() {
    TaskDatabase database = TaskDatabase();
    return TaskDao(database);
  }
}
