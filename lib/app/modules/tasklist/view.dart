/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:39:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 19:49:06
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flui/flui.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class TasklistPage extends GetView<TasklistController> {
  // 内容页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildView(),
      appBar: AppBar(
        title: Text("任务列表"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: buildContainer(context),
        ),
      ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3, left: 3), //容器外填充
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    height: 400,
                    color: Colors.grey[100],
                    child: SingleChildScrollView(
                      child: TaskList(),
                    )),
                FLRaisedButton(
                  expanded: true,
                  color: Color(0xFF0F4C81),
                  textColor: Colors.white,
                  child: Text('添加任务', textAlign: TextAlign.center),
                  onPressed: () => controller.addTask(),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              child: Listener(
                child: Text('test'),
                onPointerUp: (PointerUpEvent event) {
                  showFLBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Botomsheet();
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
