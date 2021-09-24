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
  // RxList _records = [].obs;
  // set records(value) => this._records.value = value;
  // get records => this._records.value;

  // final _encoderSupported = false.obs;
  // set encoderSupported(value) => this._encoderSupported.value = value;
  // get encoderSupported => this._encoderSupported.value;
  // final _decoderSupported = false.obs;
  // set decoderSupported(value) => this._decoderSupported.value = value;
  // get decoderSupported => this._decoderSupported.value;

  // final _isHide = true.obs;
  // set isHide(value) => this._isHide.value = value;
  // get isHide => this._isHide.value;
  // // title
  // final _title = "".obs;
  // set title(value) => this._title.value = value;
  // get title => this._title.value;
}
