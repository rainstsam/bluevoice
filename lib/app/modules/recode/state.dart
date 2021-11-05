/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 21:25:07
 */
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:get/get.dart';

class RecodeState {
  // final _costTime = 0.obs;
  // set costTime(value) => this._costTime.value = value;
  // get costTime => this._costTime.value;  
  final _count = 0.obs;
  set count(value) => this._count.value = value;
  get count => this._count.value;

  final _track = Rx<Track?>(null);
  set track(value) => this._track.value = value;
  get track => this._track.value;

  final _initialized = false.obs;
  set initialized(value) => this._initialized.value = value;
  get initialized => this._initialized.value;

}
