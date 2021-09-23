/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:47:48
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 10:00:47
 */
import 'package:get/get.dart';

import 'controller.dart';
import 'package:bluevoice/app/modules/recode/controller.dart';

class PlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayController>(() => PlayController());
  }
}
