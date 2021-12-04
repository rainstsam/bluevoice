/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 21:25:07
 */
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:get/get.dart';

class RecodeState {
  final _track = Rx<Track?>(null);
  set track(value) => this._track.value = value;
  get track => this._track.value;

  final _audioSource = AudioSource.bluetoothHFP.obs;
    set audioSource(value) => this._audioSource.value = value;
  get audioSource => this._audioSource.value;

  final _basepash = ''.obs;
  set basepash(value) => this._basepash.value = value;
  get basepash => this._basepash.value;

  final _initialized = false.obs;
  set initialized(value) => this._initialized.value = value;
  get initialized => this._initialized.value;

  final _isRecording = false.obs;
  set isRecording(value) => this._isRecording.value = value;
  get isRecording => this._isRecording.value;

  final _isPaused = false.obs;
  set isPaused(value) => this._isPaused.value = value;
  get isPaused => this._isPaused.value;

  final _isStopped = true.obs;
  set isStopped(value) => this._isStopped.value = value;
  get isStopped => this._isStopped.value;

  final _isListening = false.obs;
  set isListening(value) => this._isListening.value = value;
  get isListening => this._isListening.value;

  final _isDisabled = false.obs;
  set isDisabled(value) => this._isDisabled.value = value;
  get isDisabled => this._isDisabled.value;

 
}
