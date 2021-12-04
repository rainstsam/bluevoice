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

    final _files = [].obs;
  // var _tasklist = Rx<String?>(null);
  set files(value) => _files.value = value;
  // ignore: invalid_use_of_protected_member
  get files => _files.value;

  final _initialized = false.obs;
  set initialized(value) => this._initialized.value = value;
  get initialized => this._initialized.value;


   final _basepash = ''.obs;
  set basepash(value) => this._basepash.value = value;
  get basepash => this._basepash.value;

  final _file = ''.obs;
  set file(value) => this._file.value = value;
  get file => this._file.value;

  final _duration = 3.obs;
  set duration(value) => this._duration.value = value;
  get duration => this._duration.value;

  final _pos = 0.obs;
  set pos(value) => this._pos.value = value;
  get pos => this._pos.value;


}
