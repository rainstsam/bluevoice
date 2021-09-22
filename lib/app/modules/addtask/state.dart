/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:40:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 06:58:32
 */
// import 'package:bluevoice/app/data/task_database.dart';
import 'package:bluevoice/app/modules/tasklist/state.dart';
import 'package:get/get.dart';

class AddTaskState extends TasklistState {
  final _id = 0.obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;
  // title
  final _priority = 0.obs;
  set priority(value) => this._priority.value = value;
  get priority => this._priority.value;

  final _title = "".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;

  final _content = "".obs;
  set content(value) => this._content.value = value;
  get content => this._content.value;

  // var _tasks = Rx<Tasks?>(null);
  // // var _tasklist = Rx<String?>(null);
  // set tasks(value) => _tasks.value = value;
  // get tasks => _tasks.value;
}
