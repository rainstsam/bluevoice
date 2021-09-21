/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 23:03:43
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-17 23:20:43
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';
import 'package:flui/flui.dart';

class AddTaskForm extends GetView<AddTaskController> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDetailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: taskNameController,
          decoration: InputDecoration(
              labelText: "任务名",
              hintText: "请输入任务名称",
              prefixIcon: Icon(Icons.task)),
        ),
        TextField(
          maxLines: 5,
          controller: taskDetailController,
          decoration: InputDecoration(
              labelText: "任务细节",
              hintText: "请输入任务细节",
              prefixIcon: Icon(Icons.details)),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FLRaisedButton(
            // expanded: true,
            color: Color(0xFF0F4C81),
            textColor: Colors.white,
            child: Text('撤销', textAlign: TextAlign.center),
            onPressed: () => controller.goHome(),
          ),
          SizedBox(width: 60),
          FLRaisedButton(
            // expanded: true,

            color: Color(0xFF0F4C81),
            textColor: Colors.white,
            child: Text('添加任务', textAlign: TextAlign.center),
            onPressed: () async => controller.handleAddTask(
                taskNameController.text, taskDetailController.text),
          ),
          SizedBox(width: 10),
        ])
      ],
    );
  }
}
