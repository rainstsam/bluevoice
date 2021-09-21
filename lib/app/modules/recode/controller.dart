// ignore_for_file: import_of_legacy_library_into_null_safe

/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-21 14:13:04
 */

import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:get/get.dart';

import 'package:bluevoice/app/routes/app_pages.dart';

import './util/stroge_file.dart';
import './util/active_codec.dart';
import './util/recorder_state.dart';

import 'index.dart';

class RecodeController extends GetxController {
  RecodeController();

  /// 响应式成员变量

  // List<String> records = [];
  final state = RecodeState();

  /// 成员变量

  // FlutterSoundRecorder? recorderModule;

  /// 事件
  ////// Creates an path to a temporary file.

  init() async {
    if (!state.initialized) {
      await initializeDateFormatting();
      await UtilRecorder().init();
      ActiveCodec().recorderModule = UtilRecorder().recorderModule;
      ActiveCodec().setCodec(withUI: false, codec: Codec.aacADTS);
      state.initialized = true;
    }
  if (!kIsWeb) {
      var status = Permission.microphone.request();
      status.then((stat) {
        if (stat != PermissionStatus.granted) {
          throw RecordingPermissionException(
              'Microphone permission not granted');
        }
      });
    }}

  void goHome() {
    Get.offNamed(Paths.Tasklist);
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    init();
    // new 对象
    // 初始静态数据
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() async {
    super.onReady();
    var path = await strogeFile(suffix: 'aac');
    var track = new Track(trackPath: path);
    state.track = track;
    print(track.trackPath);
    // async 拉取数据

    // if ((await getTemporaryDirectory() != null)) {
    //   Directory documentsDirectory = await getTemporaryDirectory();
    //   defaultPath = documentsDirectory.path;
    // }
    // print(state.defaultPath.value);
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
