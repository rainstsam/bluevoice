/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:19
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 04:05:34
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';
import 'taskitem.dart';

class TaskList extends GetView<TasklistController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.tasklist == null
        ? Container(
            child: SizedBox(
              height: 60,
              child: Text(
                ('请添加任务'),
              ),
            ),
          )
        : Column(
            children: controller.state.tasklist.items.map<Widget>((item) {
              List<Widget> widgets = <Widget>[
                TaskItem(item),
                Divider(height: 1),
              ];
              return Column(
                children: widgets,
              );
            }).toList(),
          ));
  }
}
