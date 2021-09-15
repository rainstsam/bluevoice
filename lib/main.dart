/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-05 23:21:08
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-15 00:59:14
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:bluevoice/common/service/global_config.dart';

Future<void> main() async {
  await Get.putAsync(() => GlobalConfigService().init());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
