/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:19
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 19:42:06
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';
import 'taskitem.dart';

class TaskList extends GetView<TasklistController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.state.tasks.isEmpty) {
        return Container(
          child: SizedBox(
            height: 60,
            child: Text('请添加任务'),
          ),
        );
      } else {
        return SizedBox(
            height: 620,
            child: ListView.builder(
                //  scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.state.tasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    index: index,
                    task: controller.state.tasks[index],
                  );
                }));
      }
    });
  }
}
