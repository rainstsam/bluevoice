/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 19:10:34
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 01:45:28
 */

import 'package:bluevoice/app/modules/taskdetail/widgets/simple_recorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
// import 'widgets/demo.dart';
import 'widgets/widgets.dart';

class TaskdetailPage extends GetView<TaskdetailController> {
  // 内容页
  Widget _buildView() {
    // return SimpleRecorder();
    return SimpleRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.goHome, icon: Icon(Icons.arrow_back)),
        title: Text("录播测试"),
      ),
      body: _buildView(),
    );
  }
}
