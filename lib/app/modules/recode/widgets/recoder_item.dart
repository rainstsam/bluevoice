/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-23 01:00:15
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 01:33:43
 */
import 'package:bluevoice/app/modules/recode/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';

class RecoderItem extends GetView<RecodeController> {
  
  @override
  Widget build(BuildContext context) {
    return RecorderPlaybackController(
        child: Column(
      children: [
        Text('Recording Playback'),
        SoundPlayerUI.fromTrack(
          controller.state.track,
          enabled: false,
          showTitle: true,
          audioFocus: AudioFocus.requestFocusAndDuckOthers,
        ),
      ],
    ));
  }
}
