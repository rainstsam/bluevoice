/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:39:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 10:12:26
 */

import 'package:bluevoice/app/data/task_database.dart';
import 'package:bluevoice/app/data/task_model.dart';
import 'package:bluevoice/app/data/task_repository.dart';
import 'package:bluevoice/common/utils/extension/get_extension.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:bluevoice/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bluevoice/common/utils/utils.dart';
import 'index.dart';

class TasklistController extends GetxController {
  TasklistController();

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  /// 响应式成员变量

  final state = TasklistState();

  /// 成员变量
  final TaskRepository _taskRepository = Get.find<TaskRepository>();
  int _pageNum = 1;

  /// 事件

  Future<TaskModel?> _load() async {
    try {
      TaskModel model = await _taskRepository.getTask(pageNum: _pageNum);
      return model;
    } catch (e) {
      print('_load' + e.toString());
      return null;
    }
  }

  onRefresh() async {
    _pageNum = 1;
    TaskModel? model = await _load();
    if (model == null) {
      refreshController.refreshFailed();
      return;
    } else {
      refreshController.refreshCompleted();
    }
    if (model.over == true) {
      refreshController.loadNoData();
    }

    if (model.datas?.isNotEmpty == true) {
      state.tasks.clear();
      state.tasks.addAll(model.datas);
      _pageNum++;
      update();
    }
  }

  onLoadMore() async {
    TaskModel? model = await _load();
    if (model == null) {
      refreshController.loadFailed();
      return;
    }
    if (model.over == true) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }

    if (model.datas?.isNotEmpty == true) {
      state.tasks.addAll(model.datas);
      _pageNum++;
      update();
    }
  }

  addNewTask(Task task) {
    state.tasks.insert(0, task);
    update();
  }

  deleteTask(int index) async {
    Get.loading();
    try {
      bool success = await _taskRepository.deleteTask(state.tasks[index].id);
      if (success) {
        state.tasks.removeAt(index);
        update();
      }
    } catch (e) {
      print('deleteTask' + e.toString());
    }
    Get.dismiss();

    // update();
  }

  modifyTaskStatus(Task task) async {
    Get.loading();
    try {
      await _taskRepository.modifyTaskStatus(task);
      var newTask = state.tasks.firstWhere(
          (element) => element.id == task.id && element.status != task.status,
          orElse: () => null);
      if (newTask != null) {
        newTask.status = task.status;
        // print("modifyTaskStatus==${newTask.status}");
        // int index = state.tasks.indexOf(newTask);
        // print("modifyTaskStatus==${_tasks[index]}");
      }
      update();
    } catch (e) {
      print('modifyTaskStatus' + e.toString());
    }
    Get.dismiss();
  }

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  void addTask() {
    Get.offNamed(Paths.AddTask);
  }

  asyncLoadTaskList() async {
    // DatabaseHelper.instance.queryAllRows().then((value) {
    //   value.forEach((element) {
    //     state.tesklist.add(Task(
    //         id: element['id'],
    //         taskdetail: element['taskdetail'],
    //         taskname: element['taskname']));
    //   });
    // });
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
  void onReady() async {
    super.onReady();
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('AudioSource', state.AudioSource);

    // async 拉取数据
  }

  ///在 [onDelete] 方法之前调用。 [onClose] 可能用于
  ///处理控制器使用的资源。就像 closing events 一样，
  ///或在控制器销毁之前的流。
  ///或者处置可能造成一些内存泄漏的对象，
  ///像 TextEditingControllers、AnimationControllers。
  ///将一些数据保存在磁盘上也可能很有用。
  @override
  void onClose() async {
    super.onClose();
    // 1 stop & close 关闭对象
    // 2 save 持久化数据
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('AudioSource', state.AudioSource);
  }

  void onChanged(value) async {
    var prefs = await SharedPreferences.getInstance();
    state.AudioSource = value;
    if (value == 'bulemic') {
      print(1);
      prefs.setString('AudioSource', 'default');
      setBluetooth();
    } else if (value == 'mic') {
      print(2);
      prefs.setString('AudioSource', 'mic');
    } else if (value == 'customsource') {
      prefs.setString('AudioSource', 'default');
      print(3);
    }
  }

  ///dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    // dispose 释放对象
  }
}
