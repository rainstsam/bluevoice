/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:47:48
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 01:19:35
 */
// import 'package:bluevoice/app/modules/recode/controller.dart';
import 'dart:io';

// import 'package:bluevoice/app/modules/recode/util/active_codec.dart';
// import 'package:bluevoice/app/modules/recode/util/index.dart';
// import 'package:bluevoice/app/modules/recode/util/recorder_state.dart';
import 'package:bluevoice/common/utils/fileutils.dart';
import 'package:bluevoice/common/utils/souldutils.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_sound/flutter_sound.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:get/get.dart';

import 'package:bluevoice/app/routes/app_pages.dart';
import 'package:path/path.dart';

import 'index.dart';

class PlayController extends GetxController {
  PlayController();

  /// 响应式成员变量

  final state = PlayState();

  /// 成员变量

  /// 事件
  void setPlayfile(file) {
    state.file = file;
    print(file);
  }

  Future<Track?> createTrack(BuildContext context) async {
    Track? track;

    String? title;
    if (_recordingExist(context)) {
      /// build player from file

      track = await _createPathTrack();
      title = 'Recording from file playback';
      track.trackTitle = title;
      track.trackAuthor = 'By flutter_sound';
    }
    return track;
  }

  Future<Track?> _createBufferTrack() async {
    Track? track;
    // Do we want to play from buffer or from file ?
    if (fileExists(state.file)) {
      var dataBuffer = await makeBuffer(state.file);
      if (dataBuffer == null) {
        throw Exception('Unable to create the buffer');
      }
      track = Track(dataBuffer: dataBuffer, codec: ActiveCodec().codec!);
    }
    return track;
  }

  Future<Track> _createPathTrack() async {
    Track track;
    var audioFilePath = state.file;
    print(audioFilePath);
    track = Track(trackPath: audioFilePath);
    return track;
  }

  bool _recordingExist(BuildContext context) {
    // Do we want to play from buffer or from file ?
    var path = state.file;
    return (path != null && fileExists(path));
  }

  Future<Track> createRemoteTrack() async {
    Track track;
    // var task = Get.arguments;
    var path = await strogeFile(state.file, suffix: 'aac');
    // var dataBuffer = (await rootBundle.load(path)).buffer.asUint8List();

    track = Track(trackPath: path, codec: Codec.aacADTS);
    state.track = track;
    return track;
  }

  init() async {
    state.basepash = await saveVoiceDirectory(Get.arguments.title);
    state.files = await getFileList(state.basepash);
  }

  void goHome() {
    Get.offNamed(Paths.Tasklist);
  }

  void deletefile(String path) async {
    delFile(path);
    state.files = await getFileList(state.basepash);
    // var filelist = state.files;
    // filelist.remove(path);
    // state.files = filelist;
    // print(file);
  }

 

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() async {
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
    // var task = Get.arguments;
    // var path = await strogeFile(task.title, suffix: 'aac');

    // var track = new Track(trackPath: path);
    // state.track = track;

    // print(task.toString());
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
