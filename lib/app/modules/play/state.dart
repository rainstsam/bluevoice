/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:47:48
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 08:01:36
 */
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';

class PlayState {
  final _track = Rx<Track?>(null);
  set track(value) => this._track.value = value;
  get track => this._track.value;

  final _initialized = false.obs;
  set initialized(value) => this._initialized.value = value;
  get initialized => this._initialized.value;
}
