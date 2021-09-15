/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:40:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-15 18:21:52
 */
import 'package:bluevoice/app/modules/tasklist/state.dart';
import 'package:get/get.dart';

class AddTaskState extends TasklistState {
  final _id = 0.obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;
  // title

}
