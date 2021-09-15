/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:57:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-11 00:48:32
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'package:bluevoice/common/widget/animated_circular/index.dart';

class SplashPage extends GetView<SplashController> {
  // 内容页
  Widget _buildView() {
    return Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          AnimatedCircular(),
          Obx(
            () => Text(
              controller.state.wellcome,
              style: TextStyle(fontSize: 20),
            ),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }
}
