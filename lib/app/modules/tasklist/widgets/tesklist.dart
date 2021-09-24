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
    return Obx(
      () => controller.state.tasks.isEmpty
          ? Container(
              child: SizedBox(
                height: 60,
                child: Text(
                  ('请添加任务'),
                ),
              ),
            )
          : Column(
              children:
                  controller.state.tasks.asMap().entries.map<Widget>((item) {
                List<Widget> widgets = <Widget>[
                  TaskItem(
                    index: item.key,
                    task: item.value,
                  ),
                  Divider(height: 1),
                ];
                return Column(
                  children: widgets,
                );
              }).toList(),
            ),
    );
  }
  //
  //// print(controller.state.tasks);

  //   return controller.tasks.isEmpty
  //       ? Container(
  //           child: SizedBox(
  //             height: 60,
  //             child: Text(
  //               ('请添加任务'),
  //             ),
  //           ),
  //         )
  //       : Column(
  //           children: controller.tasks.items.map<Widget>((item) {
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
  //   return GetBuilder<TasklistController>(
  //     init: controller,
  //     builder: (_) {
  //       return SmartRefresher(
  //         header: MaterialClassicHeader(),
  //         controller: _.refreshController,
  //         enablePullDown: true,
  //         enablePullUp: true,
  //         onLoading: _.onLoadMore,
  //         onRefresh: _.onRefresh,
  //         // ignore: unnecessary_null_comparison
  //         child: _.state.tasks == []
  //             ? TaskCardWidget()
  //             : ListView.builder(
  //                 itemCount: _.state.tasks.length,
  //                 itemBuilder: (context, index) {
  //                   return Text(index.toString()
  //                       // context,
  //                       // index,
  //                       // task: _.state.tasks[index],
  //                       );
  //                 },
  //               ),
  //       );
  //     },
  //   );
  // }
  // return GetBuilder<TasklistController>(
  //     init: controller,
  //     builder: (_) {
  //   _.tasks.length == 0
  //       ? TaskCardWidget()
  //       : ListView.builder(
  //           itemCount: _.tasks.length,
  //           itemBuilder: (context, index) {
  //             return TaskItem(
  //               context,
  //               index,
  //               task: _.tasks[index],
  //             );
  //           },
  //         );
  // });
  // }
}
