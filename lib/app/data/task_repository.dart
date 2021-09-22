/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2021-09-22 10:49:25
 * @LastEditors: rainstsam
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/repositories/task_repository.dart
 */
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

import 'task_dao.dart';
import 'task_database.dart';
import 'task_model.dart';

class TaskRepository {
  final TaskDao taskDao = Get.find<TaskDao>();

  Future<TaskModel> getTask({int pageNum = 1}) async {
    var data = await taskDao.getTasks(20, offset: (pageNum - 1) * 20);
    TaskModel model =
        TaskModel(curPage: pageNum, datas: data, over: ((data.length) == true));
    return model;
  }

  Future<Task> addTask(String title,
      {String? content, String? date, int type = 0, int priority = 0}) async {
    Task? task;

    TasksCompanion tasksCompanion = TasksCompanion(
      title: Value(task!.title),
      content: Value(task.content ?? content),
      id: task.id == null ? Value<int>.absent() : Value(task.id),
      dateStr: Value(task.dateStr ?? date),
      type: Value(task.type),
      priority: Value(task.priority ?? priority),
    );
    return await taskDao.createTask(tasksCompanion);
  }

  Future<bool> deleteTask(int id) async {
    int row = await taskDao.deleteTaskById(id);
    return row > 0;
  }

  Future<void> modifyTaskStatus(Task task) async {
    taskDao.modifyTask(task);
  }

  Future<void> updateTask(Task task) async {
    await taskDao.modifyTask(task);
  }
}
