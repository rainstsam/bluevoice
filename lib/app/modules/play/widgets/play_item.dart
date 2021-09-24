/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-23 01:00:28
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 00:41:13
 */

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';

import '../index.dart';

class PlayItem extends GetView<PlayController> {
  @override
  Widget build(BuildContext context) {
    return SoundPlayerUI.fromLoader(
      (_)=>controller.createRemoteTrack(),
      showTitle: true,
      audioFocus: AudioFocus.requestFocusAndDuckOthers,
    );
  }
}
