/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:39:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 10:16:24
 */
import 'package:get/get.dart';
import 'package:bluevoice/app/data/task_repository.dart';

import 'controller.dart';

class TasklistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasklistController>(() => TasklistController());
    Get.lazyPut<TaskRepository>(() => TaskRepository());
  }
}
