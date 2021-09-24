/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:47:48
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 01:25:28
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class PlayPage extends GetView<PlayController> {
  // 内容页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.goHome, icon: Icon(Icons.arrow_back)),
        title: Text("播放监听结果"),
      ),
      body: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => controller.state.initialized
                  ? Container(
                      width: 400,
                      height: 200,
                      color: Colors.white,
                      child: Text(controller.state.track.trackPath))
                  // : RecorderPlaybackController(
                  : Container(
                      child: Column(
                      children: [
                        Text(controller.state.track.trackPath),
                        PlayItem(),
                         Text("回放"),
                      ],
                    ))))),
    );
  }
}
