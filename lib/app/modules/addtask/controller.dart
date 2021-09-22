/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:40:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 01:24:07
 */
import 'package:bluevoice/app/data/priority.dart';
import 'package:bluevoice/app/data/task_repository.dart';
import 'package:bluevoice/common/utils/extension/date_extension.dart';
import 'package:bluevoice/common/utils/extension/get_extension.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:bluevoice/app/data/task_database.dart';
import 'package:bluevoice/app/modules/tasklist/controller.dart';

import 'package:bluevoice/app/routes/app_pages.dart';
import 'index.dart';

class AddTaskController extends GetxController {
  final TaskRepository _taskRepository = Get.find<TaskRepository>();
  // AddTaskController();

  /// 响应式成员变量

  final state = AddTaskState();

  /// 成员变量

  /// 局部更新id
  final String updateDateId = 'update_date';
  final String updatePriorityId = 'update_priority';

  /// 表格key
  final formKey = GlobalKey<FormState>();

  /// 日期
  final dateTimeController =
      TextEditingController(text: DateTime.now().format());
  late DateTime _dateTime;
  late String _title;
  late String _content;
  late int _priority;

  /// 事件

  // void handleAddTask(String taskname, String taskdetail) async {
  //   var task = TaskItem.fromJson(
  //       {"id": state.id, "taskdetail": taskdetail, "taskname": taskname});
  //   var prefs = await SharedPreferences.getInstance();
  //   var taskitem = task.toString();
  //   var tasklist = prefs.getStringList('tasklist');
  //   print(tasklist);
  //   if (tasklist == null) {
  //     tasklist = [taskitem];
  //   } else {
  //     tasklist.add(taskitem);
  //   }
  //   print(tasklist);
  //   state.id++;
  //   prefs.setInt('taskcount', state.id);
  //   prefs.setStringList('tasklist', tasklist);
  //   // var task = {"id": state.id, "taskdetail": taskdetail, "taskname": taskname};
  //   // var db = await DatabaseHelper.instance.database;
  //   // await db!.insert('task', task);
  //   Get.offNamed(Paths.Tasklist);
  // }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    _priority = priorities[0];
    _dateTime = DateTime.now();
    // new 对象
    // 初始静态数据
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() async {
    super.onReady();
  }

  void saveTitle(String value) {
    _title = value;
  }

  void saveContent(String value) {
    _content = value;
  }

  void changePriority(String value) {
    _priority = priorities[prioritiesStr.indexOf(value)];
  }

  void goHome() {
    Get.offNamed(Paths.Tasklist);
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        Get.loading();
        Task task = await _taskRepository.addTask(_title,
            content: _content, date: _dateTime.format(), priority: _priority);
        Get.dismiss();
        TasklistController controller = Get.find<TasklistController>();
        controller.addNewTask(task);
        Get.back();
      } catch (e) {
        print('submit==$e');
        Get.dismiss();
        Get.snackbar('Error', e.toString());
      }
    }
  }

  ///在 [onDelete] 方法之前调用。 [onClose] 可能用于
  ///处理控制器使用的资源。就像 closing events 一样，
  ///或在控制器销毁之前的流。
  ///或者处置可能造成一些内存泄漏的对象，
  ///像 TextEditingControllers、AnimationControllers。
  ///将一些数据保存在磁盘上也可能很有用。
  @override
  void onClose() {
    super.onClose();
    // 1 stop & close 关闭对象
    // 2 save 持久化数据
  }

  ///dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    // dispose 释放对象
  }
}
