/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-23 01:00:28
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 06:39:52
 */
import 'package:bluevoice/app/modules/recode/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';

class PlayItem extends GetView<RecodeController> {
  @override
  Widget build(BuildContext context) {
    return RecorderPlaybackController(
        child: Column(
      children: [
        Text('监听录制'),
        SoundRecorderUI(controller.state.track),
      ],
    ));
  }
}
