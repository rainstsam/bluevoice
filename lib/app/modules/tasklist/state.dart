/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:39:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 04:41:36
 */
import 'package:get/get.dart';
import 'package:bluevoice/app/data/task.dart';

class TasklistState {
  // title

  var _tasklist = Rx<TasklistItems?>(null);
  // var _tasklist = Rx<String?>(null);
  set tasklist(value) => _tasklist.value = value;
  get tasklist => _tasklist.value;
  void appendTasklistItems(TasklistItems value) {
    if (_tasklist.value != null) {
      _tasklist.value!.items?.addAll(value.items!.toList());
    }
  }

  final _AudioSource = 'bulemic'.obs;
  get AudioSource => this._AudioSource.value;
  set AudioSource(value) => this._AudioSource.value = value;
}
