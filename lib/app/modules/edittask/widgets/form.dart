/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 23:03:43
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-13 23:56:23
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';
import 'package:flui/flui.dart';

class EditTaskForm extends GetView<EdittaskController> {
  late int id;
  late String taskname;
  late String taskdetail;
  EditTaskForm(id, taskname, taskdetail) {
    this.id = id;
    this.taskname = taskname;
    this.taskdetail = taskdetail;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: "任务名",
              hintText: taskname,
              prefixIcon: Icon(Icons.task)),
        ),
        TextField(
          maxLines: 10,
          decoration: InputDecoration(
              labelText: "任务细节",
              hintText: taskdetail,
              prefixIcon: Icon(Icons.details)),
        ),
        Row(children: <Widget>[
          FLFlatButton(
            // expanded: true,
            color: Color(0xFF0F4C81),
            textColor: Colors.white,
            child: Text('撤销', textAlign: TextAlign.center),
            onPressed: () => controller.goHome(),
          ),
          FLFlatButton(
            // expanded: true,
            color: Color(0xFF0F4C81),
            textColor: Colors.white,
            child: Text('添加任务', textAlign: TextAlign.center),
            onPressed: () => controller.goHome(),
          ),
        ])
      ],
    );
  }
}
