/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:42:18
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-13 18:37:39
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class EdittaskPage extends GetView<EdittaskController> {
  // 内容页
  Widget _buildView() {
    // return HelloWidget();
    return Text('data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.goHome, icon: Icon(Icons.arrow_back)),
        title: Text("修改任务"),
      ),
      body: _buildView(),
    );
  }
}
