/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 19:10:34
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 19:50:03
 */
// import 'package:bluevoice/app/data/task_model.dart';
// import 'package:bluevoice/app/data/task_repository.dart';
import 'package:get/get.dart';

import 'package:bluevoice/app/routes/app_pages.dart';

import 'index.dart';

class TaskdetailController extends GetxController {
  TaskdetailController();
  // final TaskRepository _taskRepository = Get.find<TaskRepository>();

  /// 响应式成员变量

  final state = TaskdetailState();

  /// 成员变量

  /// 事件
  // Future<TaskModel?> _load() async {
  //   try {
  //     TaskModel model = await _taskRepository.getTask(pageNum: _pageNum);
  //     return model;
  //   } catch (e) {
  //     print('_load' + e.toString());
  //     return null;
  //   }
  // }

  // onRefresh() async {
  //   _pageNum = 1;
  //   TaskModel model = await _load();
  //   if (model == null) {
  //     refreshController.refreshFailed();
  //     return;
  //   } else {
  //     refreshController.refreshCompleted();
  //   }
  //   if (model.over == true) {
  //     refreshController.loadNoData();
  //   }

  //   if (model.datas?.isNotEmpty == true) {
  //     _tasks.clear();
  //     _tasks.addAll(model.datas);
  //     _pageNum++;
  //     update();
  //   }
  // }

  // onLoadMore() async {
  //   TaskModel model = await _load();
  //   if (model == null) {
  //     refreshController.loadFailed();
  //     return;
  //   }
  //   if (model.over == true) {
  //     refreshController.loadNoData();
  //   } else {
  //     refreshController.loadComplete();
  //   }

  //   if (model.datas?.isNotEmpty == true) {
  //     _tasks.addAll(model.datas);
  //     _pageNum++;
  //     update();
  //   }
  // }

  // addNewTask(Task task) {
  //   _tasks.insert(0, task);
  //   update();
  // }

  // deleteTask(int index) async {
  //   Get.loading();
  //   try {
  //     bool success = await _taskRepository.deleteTask(_tasks[index].id);
  //     if (success) {
  //       _tasks.removeAt(index);
  //       update();
  //     }
  //   } catch (e) {
  //     print('deleteTask' + e.toString());
  //   }
  //   Get.dismiss();

  //   // update();
  // }

  // modifyTaskStatus(Task task) async {
  //   Get.loading();
  //   try {
  //     await _taskRepository.modifyTaskStatus(task);
  //     var newTask = _tasks.firstWhere(
  //         (element) => element.id == task.id && element.status != task.status,
  //         orElse: () => null);
  //     if (newTask != null) {
  //       newTask.status = task.status;
  //       // print("modifyTaskStatus==${newTask.status}");
  //       // int index = _tasks.indexOf(newTask);
  //       // print("modifyTaskStatus==${_tasks[index]}");
  //     }
  //     update();
  //   } catch (e) {
  //     print('modifyTaskStatus' + e.toString());
  //   }
  //   Get.dismiss();
  // }

  void goHome() {
    Get.offNamed(Paths.Tasklist);
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    // new 对象
    // 初始静态数据
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() {
    super.onReady();
    // async 拉取数据
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
