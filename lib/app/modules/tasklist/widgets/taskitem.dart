/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:39
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 00:37:55
 */
import 'package:bluevoice/app/routes/app_pages.dart';
import 'package:bluevoice/app/data/task_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../index.dart';

class TaskItem extends GetView<TasklistController> {
  final Task task;
  final int index;
  final VoidCallback? onItemClick;
  final ValueChanged<bool>? onCheckBoxChanged;

  TaskItem({
    Key? key,
    this.onItemClick,
    this.onCheckBoxChanged,
    required this.task,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.green[100],
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: _buildRow(context),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        child: InkWell(
          onTap: () => print(task.id),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: 25,
                height: 25,
                child: Text((index + 1).toString()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(task.dateStr!,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontSize: 14, color: Colors.blue)),
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(task.content!,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            fontSize: 14,
                          )),
                ],
              ),
              Spacer(),
              Container(
                width: 5,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        actionExtentRatio: 0.20, // 侧滑按钮所占的宽度
        enabled: true, //
        actions: <Widget>[
          IconSlideAction(
            caption: '回放',
            color: Colors.blue,
            icon: Icons.play_arrow,
            onTap: () => Get.offNamed(Paths.Play, arguments: task),
            closeOnTap: false,
          ),
          IconSlideAction(
            caption: '录制',
            color: Colors.indigo,
            icon: Icons.record_voice_over_outlined,
            onTap: () => Get.offNamed(Paths.Recode, arguments: task),
          ),
        ],

        secondaryActions: [
          IconSlideAction(
            caption: '删除',
            color: Colors.red,
            icon: Icons.delete_forever,
            onTap: () => controller.deleteTask(index),
            closeOnTap: false,
          ),
          IconSlideAction(
            caption: '详情',
            color: Colors.indigo,
            icon: Icons.details,
            onTap: () => Get.offNamed(Paths.EditTask, arguments: task),
          ),
        ],
      ),
    );
  }
}
