/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:39
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 06:31:01
 */
import 'package:bluevoice/app/routes/app_pages.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../index.dart';

class TaskItem extends GetView<TasklistController> {
  late int id;
  late String taskname;
  late String taskdetail;

  TaskItem(item) {
    this.id = item.id;

    this.taskname = item.taskname;
    this.taskdetail = item.taskdetail;
  }
  @override
  Widget build(BuildContext context) {
    var idstr = (id + 1).toString();
    var args = {'id': id, 'taskname': taskname, 'taskdetail': taskdetail};
    if (this.taskname == 'taskname') {
      return FLFlatButton(
        expanded: true,
        color: Color(0xFF0F4C81),
        textColor: Colors.white,
        child: Text('删除所有任务', textAlign: TextAlign.center),
        onPressed: () => controller.addTask(),
      );
    } else {}

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Slidable(
          actionPane: SlidableScrollActionPane(),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text('$idstr'),
              foregroundColor: Colors.white,
            ),
            title: Text('$taskname'),
            subtitle: Text('$taskdetail'),
          ),
          actionExtentRatio: 0.20, // 侧滑按钮所占的宽度
          enabled: true, //
          actions: <Widget>[
            IconSlideAction(
              caption: '回放',
              color: Colors.blue,
              icon: Icons.play_arrow,
              onTap: () => Get.offNamed(Paths.Play, arguments: args),
              closeOnTap: false,
            ),
            IconSlideAction(
              caption: '录制',
              color: Colors.indigo,
              icon: Icons.record_voice_over_outlined,
              onTap: () => Get.offNamed(Paths.Recode),
            ),
          ]),
    );
  }
}

class ActionPane {}
