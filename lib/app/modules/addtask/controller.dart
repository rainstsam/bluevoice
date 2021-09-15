/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:40:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 06:30:45
 */
import 'package:get/get.dart';
import 'package:bluevoice/app/data/databasehelper.dart';
import 'package:bluevoice/app/data/task.dart';
import 'package:bluevoice/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'index.dart';

class AddTaskController extends GetxController {
  AddTaskController();

  /// 响应式成员变量

  final state = AddTaskState();

  /// 成员变量

  /// 事件

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  void handleAddTask(String taskname, String taskdetail) async {
    var task = TaskItem.fromJson(
        {"id": state.id, "taskdetail": taskdetail, "taskname": taskname});
    var prefs = await SharedPreferences.getInstance();
    var taskitem = task.toString();
    var tasklist = prefs.getStringList('tasklist');
    print(tasklist);
    if (tasklist == null) {
      tasklist = [taskitem];
    } else {
      tasklist.add(taskitem);
    }
    print(tasklist);
    state.id++;
    prefs.setInt('taskcount', state.id);
    prefs.setStringList('tasklist', tasklist);
    // var task = {"id": state.id, "taskdetail": taskdetail, "taskname": taskname};
    // var db = await DatabaseHelper.instance.database;
    // await db!.insert('task', task);
    Get.offNamed(Paths.Tasklist);
  }

  void handleDel() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('taskcount');
    prefs.remove('tasklist');
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
    state.id = prefs.getInt('taskcount');
    // async 拉取数据
  }

  void goHome() {
    Get.offNamed(Paths.Tasklist);
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
