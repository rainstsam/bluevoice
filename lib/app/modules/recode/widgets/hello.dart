/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-20 21:43:31
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hello
class HelloWidget extends GetView<RecodeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('controller.state.title'),
    );
  }
}
