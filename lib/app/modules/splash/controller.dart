/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:57:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 01:50:18
 */
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:system_shortcuts/system_shortcuts.dart';
import 'package:bluevoice/app/routes/app_pages.dart';

import 'index.dart';

class SplashController extends GetxController {
  SplashController();

  /// 响应式成员变量

  final state = SplashState();

  /// 成员变量

  /// 事件

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() async {
    super.onInit();
    var isOpen = await SystemShortcuts.checkBluetooth;
    if (!isOpen) {
      state.wellcome = '请打开蓝牙';
    }
    // new 对象
    // 初始静态数据
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(Duration(seconds: 3));
var isOpen = await SystemShortcuts.checkBluetooth;
    if (!isOpen) {
      SystemShortcuts.bluetooth();
    }
    // await SystemShortcuts.
    Get.offNamed(Paths.Tasklist);
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
