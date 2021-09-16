// ignore_for_file: import_of_legacy_library_into_null_safe

/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 10:17:58
 */
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:flutter_sound/flutter_sound_recorder.dart';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:bluevoice/common/utils/utils.dart';
import 'package:flutter_sound/flauto.dart';

import 'package:path_provider/path_provider.dart';
import 'package:bluevoice/app/data/task.dart';
import 'package:bluevoice/app/routes/app_pages.dart';
import 'index.dart';

class RecodeController extends GetxController {
  RecodeController();
  late FlutterSoundPlayer playerModule;
  late FlutterSoundRecorder recorderModule;
  late t_CODEC _codec = t_CODEC.CODEC_AAC;

  /// 响应式成员变量

  // List<String> records = [];
  final state = RecodeState();

  /// 成员变量

  /// 事件

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  init() async {
    playerModule = await FlutterSoundPlayer().initialize();
    recorderModule = await FlutterSoundRecorder().initialize();
  }

  Future<bool> fileExists(String path) async {
    return await File(path).exists();
  }

  Future<void> startPlayer(String url) async {
    if (url == null) {
      return;
    } else {
      await playerModule.startPlayer(url, codec: _codec, whenFinished: () {
        log("播放完成");
      });
    }
  }

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

  Future<Uint8List?> makeBuffer(String path) async {
    try {
      if (!await fileExists(path)) return null;
      File file = File(path);
      file.openRead();
      var contents = await file.readAsBytes();
      print('The file is ${contents.length} bytes long.');
      return contents;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //开始录音
  startRecord() async {
    state.isHide = false;
    Directory tempDir = await getTemporaryDirectory();
    String path = await recorderModule.startRecorder(
      uri:
          '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}-${Platform.isAndroid ? "mp3" : "m4a"}',
      codec: _codec,
    );
    state.records.add(path);
    recorderModule.onRecorderStateChanged.listen((e) {
      if (e != null && e.currentPosition != null) {
        DateTime date = new DateTime.fromMillisecondsSinceEpoch(
            e.currentPosition.toInt(),
            isUtc: true);

        state.costTime = date.second;
      }
    });
  }

  //停止录音
  stopRecord() async {
    await recorderModule.stopRecorder();

    state.isHide = true;
    state.costTime = 0;
  }

  //取消录音
  cancelRecord() async {
    state.records.removeLast();
    await recorderModule.stopRecorder();

    state.isHide = true;
    state.costTime = 0;
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
