/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 01:24:09
 */
// import 'package:bluevoice/app/modules/recode/widgets/recoder_item.dart';
import 'package:bluevoice/app/modules/recode/widgets/simple_recorder.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
// import './widgets/play_item.dart';
// import './widgets/recoder_item.dart';
import 'index.dart';
import 'widgets/widgets.dart';
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
      body: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
child: Column(
                      children: [
                        Text('监听'),
                        PlayFromMic(),
                        Text('录制'),
                        // Obx(() =>                         SoundRecorderUI(
                        //     controller.state.track,
                        //     onDelete: () => print(controller.state.track),
                        //     onStart: ()async => controller.startRecorder,
                        //     // onStopped: () => print('stop'),
                        //   ),
                        // )
                        SimpleRecorder()

               
                      ],
                    ))),
    );
  }
}
