/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:19
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 11:35:54
 */
import 'package:bluevoice/common/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../index.dart';
import 'taskitem.dart';

class TaskList extends GetView<TasklistController> {
  @override
  Widget build(BuildContext context) {
    // print(controller.state.tasks);

    //   return controller.state.tasks == null
    //       ? Container(
    //           child: SizedBox(
    //             height: 60,
    //             child: Text(
    //               ('请添加任务'),
    //             ),
    //           ),
    //         )
    //       : Column(
    //           children: controller.state.tasks.items.map<Widget>((item) {
    //             List<Widget> widgets = <Widget>[
    //               TaskItem(
    //                 task: item,
    //               ),
    //               Divider(height: 1),
    //             ];
    //             return Column(
    //               children: widgets,
    //             );
    //           }).toList(),
    //         );
    // }
    return GetBuilder<TasklistController>(
      init: controller,
      builder: (_) {
        return SmartRefresher(
          header: MaterialClassicHeader(),
          controller: _.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: _.onLoadMore,
          onRefresh: _.onRefresh,
          child: _.state.tasks.isEmpty
              ? TaskCardWidget()
              : ListView.builder(
                  itemCount: _.state.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      context,
                      index,
                      task: _.state.tasks[index],
                    );
                  },
                ),
        );
      },
    );
  }
}
