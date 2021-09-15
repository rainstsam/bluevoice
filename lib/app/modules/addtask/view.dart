/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:40:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 06:35:40
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flui/flui.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class AddTaskPage extends GetView<AddTaskController> {
  // 内容页
  Widget _buildView() {
    // return HelloWidget();
    return Container(
      child: Center(
        child: AddTaskForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.goHome, icon: Icon(Icons.arrow_back)),
        title: Text("添加任务"),
      ),
      body: _buildView(),
    );
  }
}
