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
import 'package:bluevoice/common/utils/fileutils.dart';
import 'package:bluevoice/common/utils/souldutils.dart';

// import './util/recorder_state.dart';

import 'index.dart';

typedef Fn = void Function();

class RecodeController extends GetxController {
  RecodeController();

  /// 响应式成员变量

  // List<String> records = [];
  final state = RecodeState();

  /// 成员变量

  FlutterSoundRecorder recorderModule = FlutterSoundRecorder();

  static int _timer = 5 * 60 * 1000;

  /// 事件

  init() async {
    var prefs = await SharedPreferences.getInstance();
    var Source = prefs.getString('AudioSource');

    if (Source == 'mic') {
      state.audioSource = AudioSource.microphone;
    } else if (Source == 'bluemic') {
      state.audioSource = AudioSource.bluetoothHFP;
    } else if (Source == 'blue') {
      state.audioSource = AudioSource.defaultSource;
    }
    if (!state.initialized) {
      await initializeDateFormatting();

      await recorderModule.openAudioSession(focus: AudioFocus.requestFocus);

      state.initialized = true;
    }

    state.basepash = await saveVoiceDirectory(Get.arguments.title);
    if (!kIsWeb) {
      var status = Permission.microphone.request();
      status.then((stat) {
        if (stat != PermissionStatus.granted) {
          throw RecordingPermissionException(
              'Microphone permission not granted');
        }
      });
    }
  }

  Fn? onTapStartStop() {
    if (!state.isDisabled) {
      if (state.isRecording || state.isPaused) {
        stopRecorder();
      } else {
        startRecorder();
      }
    }
  }

  void goHome() {
    Get.offNamed(Paths.Tasklist);
  }

  /// stops the recorder.
  void stopRecorder() async {
    await recorderModule.stopRecorder();

    state.isRecording = false;
    state.isStopped = true;
  }

  /// starts the recorder.
  void startRecorder() async {
    try {
      var fileurl = await strogeFile(state.basepash, suffix: 'aac');
      print('fileurl is' + fileurl!);
      await recorderModule.startRecorder(
          toFile: fileurl, audioSource: state.audioSource);
      state.isRecording = true;
      state.isStopped = false;
    } on Exception catch (err) {
      print('startRecorder error: $err');
      await recorderModule.stopRecorder();
    }
  }

  /// toggles the pause/resume start of the recorder
  void pauseRecorder() {
    assert(recorderModule.isRecording || recorderModule.isPaused);

    recorderModule.pauseRecorder();
  }

  void resumeRecorder() {
    assert(recorderModule.isRecording || recorderModule.isPaused);

    recorderModule.resumeRecorder();
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() async {
    super.onInit();
    await init();
    // new 对象
    // 初始静态数据
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() async {
    var fileurl = await strogeFile(state.basepash, suffix: 'aac');
    print('fileurl is' + fileurl!);
    state.track = Track(trackPath: fileurl, codec: ActiveCodec().codec!);
    // state.track = track;
    super.onReady();
  }

  ///在 [onDelete] 方法之前调用。 [onClose] 可能用于

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
    state.initialized = false;
    // dispose 释放对象
  }
}
