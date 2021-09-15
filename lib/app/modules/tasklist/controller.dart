/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:39:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 04:58:23
 */

import 'package:get/get.dart';
import 'dart:convert';
// import 'package:bluevoice/app/data/databasehelper.dart';
import 'package:bluevoice/app/data/task.dart';
import 'package:bluevoice/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bluevoice/common/utils/utils.dart';
import 'index.dart';

class TasklistController extends GetxController {
  TasklistController();

  /// 响应式成员变量

  final state = TasklistState();

  /// 成员变量

  /// 事件
  ///
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
    if (prefs.getInt('taskcount') == null) {
      prefs.setInt('taskcount', 0);
    } else {
      // ignore: unused_local_variable
      // var defult = {"id": 500, "taskname": 'taskname', "taskdetail": 'taskdetail'};
      // List< dynamic> list = List<dynamic>.filled(500, defult, growable: true);
      List<dynamic> list=[{"id": 500, "taskname": 'taskname', "taskdetail": 'taskdetail'}];

      print(prefs.getInt('taskcount'));
      prefs.getStringList('tasklist')!.forEach((element) {
        var taskMap = json.decode(element);
        print(element);
        // TaskItem task = TaskItem.fromJson(taskMap);
        // print(state.tasklist);
        list.add(taskMap);
      });
      state.tasklist = TasklistItems.fromJson({"items": list});
    }
    prefs.setString('AudioSource', state.AudioSource);

    // asyncLoadTaskList();

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
