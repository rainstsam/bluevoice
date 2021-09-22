/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 00:20:44
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 10:51:45
 */
import 'package:bluevoice/common/service/task_dao_service.dart';
import 'package:get/get.dart';
import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class GlobalConfigService extends GetxService {
  var isIOS = false.obs;

  Future<GlobalConfigService> init() async {
    Get.put(TaskDaoController().init());
    isIOS.value = Platform.isIOS;
    return this;
  }
}
