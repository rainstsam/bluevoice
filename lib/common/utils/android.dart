/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-11 11:22:08
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-11 15:18:35
 */
import 'package:android_intent_plus/android_intent.dart';
// import 'package:platform/platform.dart';
import 'dart:io';

void setBluetooth() async {
  if (Platform.isAndroid) {
    final AndroidIntent intent = AndroidIntent(
      action: 'android.settings.BLUETOOTH_SETTINGS',
    );
    await intent.launch();
  }
}
