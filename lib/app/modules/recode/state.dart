/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 10:07:23
 */
import 'package:get/get.dart';

class RecodeState {
  final _costTime = 0.obs;
  set costTime(value) => this._costTime.value = value;
  get costTime => this._costTime.value;

  RxList _records = [].obs;

  set records(value) => this._records.value = value;
  get records => this._records.value;

  final _isHide = true.obs;
  set isHide(value) => this._isHide.value = value;
  get isHide => this._isHide.value;
  // title
  final _title = "".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;
}
