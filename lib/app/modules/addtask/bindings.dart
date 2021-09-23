/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:40:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 18:06:22
 */
import 'package:bluevoice/app/data/task_repository.dart';
import 'package:get/get.dart';
import 'package:bluevoice/app/modules/tasklist/controller.dart';

import 'controller.dart';

class AddTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(() => AddTaskController());
    Get.lazyPut<TasklistController>(() => TasklistController());
    Get.lazyPut<TaskRepository>(() => TaskRepository());
  }
}
