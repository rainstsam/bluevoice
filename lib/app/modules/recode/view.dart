/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-21 14:16:33
 */
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
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
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() =>!controller.state.initialized? Container(
              width: 0,
              height: 0,
              color: Colors.white,
            ):RecorderPlaybackController(
                      child: Column(
                    children: [
                      Text(controller.state.track.trackPath),
                      SoundRecorderUI(controller.state.track),
                      Text('Recording Playback'),
                      SoundPlayerUI.fromTrack(
                        controller.state.track,
                        enabled: false,
                        showTitle: true,
                        audioFocus: AudioFocus.requestFocusAndDuckOthers,
                      ),
                    ],
                  ))))),
    );
  }
}
