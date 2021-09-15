/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 06:36:16
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
// import 'widgets/widgets.dart';

class RecodePage extends GetView<RecodeController> {
  // 内容页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.goHome, icon: Icon(Icons.arrow_back)),
        title: Text("监听录制"),
      ),
    );
  }
}
