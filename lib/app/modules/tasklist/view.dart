/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:39:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-18 15:22:56
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';

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
      body: Container(
        margin: EdgeInsets.only(top: 3, left: 3), //容器外填充
        child: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  TaskList(),
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
      ),
    );
  }
}
