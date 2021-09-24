/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-12 00:05:09
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 19:42:23
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller.dart';

class Botomsheet extends GetView<TasklistController> {
  const Botomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FLCupertinoActionSheet(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Obx(() => RadioListTile(
                value: 'bulemic',
                groupValue: controller.state.AudioSource,
                onChanged: (value) {
                  controller.onChanged(value);
                  Navigator.pop(context, 'Cancel');
                },
                title: Text('蓝牙麦克风'))),
            Obx(() => RadioListTile(
                value: 'mic',
                groupValue: controller.state.AudioSource,
                onChanged: (value) {
                  controller.onChanged(value);
                  Navigator.pop(context, 'Cancel');
                },
                title: Text('麦克风'))),
            Obx(() => RadioListTile(
                value: 'customsource',
                groupValue: controller.state.AudioSource,
                onChanged: (value) {
                  controller.onChanged(value);
                  Navigator.pop(context, 'Cancel');
                },
                title: Text('自选音源')))
          ],
        ),
      ),
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      ),
    );
  }
}
