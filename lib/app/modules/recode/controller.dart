// ignore_for_file: import_of_legacy_library_into_null_safe

/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 23:04:44
 */

import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

import 'package:bluevoice/app/routes/app_pages.dart';

import './util/stroge_file.dart';
import './util/active_codec.dart';
// import './util/recorder_state.dart';

import 'index.dart';

class RecodeController extends GetxController {
  RecodeController();

  /// 响应式成员变量

  // List<String> records = [];
  final state = RecodeState();

  /// 成员变量

  FlutterSoundRecorder? recorderModule = FlutterSoundRecorder();

  /// 事件
  // ////// Creates an path to a temporary file.
  // handleAddFile() async {
  //   //   await _incrementCounter();
  //   state.count = await _readCounter();
  //   state.count++; // write the variable as a string to the file
  //   await (await _getLocalFile()).writeAsString('$state.count.value');
  //   print(state.count.toString());
  // }

  init() async {
    if (!state.initialized) {
      await initializeDateFormatting();
      // await UtilRecorder().init();
      // recorderModule = FlutterSoundRecorder();
      await recorderModule!
          .openAudioSession(focus: AudioFocus.requestFocusAndDuckOthers);
      // ActiveCodec().recorderModule = UtilRecorder().recorderModule;
      // ActiveCodec().setCodec(withUI: false, codec: Codec.aacADTS);
      state.initialized = true;
    }
    // if (!kIsWeb) {
    //   var status = Permission.microphone.request();
    //   status.then((stat) {
    //     if (stat != PermissionStatus.granted) {
    //       throw RecordingPermissionException(
    //           'Microphone permission not granted');
    //     }
    //   });
    // }
  }

  void goHome() {
    Get.offNamed(Paths.Tasklist);
  }

  /// `true` if we are currently recording.
  bool get isRecording => recorderModule != null && recorderModule!.isRecording;

  /// `true` if we are recording but currently paused.
  bool get isPaused => recorderModule != null && recorderModule!.isPaused;

  /// stops the recorder.
  void stopRecorder() async {
    await recorderModule!.stopRecorder();
  }

  /// starts the recorder.
  void startRecorder() async {
    print('wqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqwqwqwwqwq');
    try {
      var prefs = await SharedPreferences.getInstance();
      var Source = prefs.getString('AudioSource');
      var audioSource = AudioSource.bluetoothHFP;
      if (Source == 'mic') {
        audioSource = AudioSource.microphone;
      } else if (Source == 'bluemic') {
        audioSource = AudioSource.bluetoothHFP;
      } else if (Source == 'blue') {
        audioSource = AudioSource.defaultSource;
      }
      var task = Get.arguments;
      var track = Track(
          trackPath: await strogeFile(task.title, suffix: 'aac'),
          codec: ActiveCodec().codec!);
      // await recorderModule!.startRecorder(toFile: track.trackPath);
      await recorderModule!
          .startRecorder(toFile: track.trackPath, audioSource: audioSource);

      print('startRecorder: $track');
      print('audioSource: $audioSource');
    } on Exception catch (err) {
      print('startRecorder error: $err');
      // await recorderModule!.stopRecorder();
    }
  }

  /// toggles the pause/resume start of the recorder
  void pauseResumeRecorder() {
    assert(recorderModule!.isRecording || recorderModule!.isPaused);
    if (recorderModule!.isPaused) {
      recorderModule!.resumeRecorder();
    } else {
      recorderModule!.pauseRecorder();
    }
  }

  // Future<Null> _incrementCounter() async {
  //   state.count = await _readCounter();
  //   state.count++; // write the variable as a string to the file
  //   await (await _getLocalFile()).writeAsString('$state.count.value');
  //   print(state.count.toString());
  // }

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

    var task = Get.arguments;
    var path = await strogeFile(task.title, suffix: 'aac');
    var track = new Track(trackPath: path);
    state.track = track;

    print(task.toString());
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
    // super.dispose();
    // dispose 释放对象
  }
}
