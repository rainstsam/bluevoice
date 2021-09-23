/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:39:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 20:26:11
 */
import 'package:get/get.dart';
import 'package:bluevoice/app/data/task_database.dart';

class TasklistState {
  // title

   final _tasks =<Task>[].obs;
  // var _tasklist = Rx<String?>(null);
  set tasks(value) => _tasks.value = value;
  get tasks => _tasks.value;
  // void appendTasklistItems(Task value) {
  //   if (_tasks.value != null) {
  //     _tasks.value!.items?.addAll(value.items!.toList());
  //   }
  // }
  final _pageNum = 1.obs;
  get pageNum => this._pageNum.value;
  set pageNum(value) => this._pageNum.value = value;

  final _AudioSource = 'bulemic'.obs;
  get AudioSource => this._AudioSource.value;
  set AudioSource(value) => this._AudioSource.value = value;
}
