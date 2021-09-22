// ignore_for_file: unnecessary_null_comparison

/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-05 23:21:08
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 10:51:59
 */
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'package:bluevoice/common/service/global_config.dart';

Future<void> main() async {
  SharedPreferences.setMockInitialValues({});
  // MethodChannel mthodChannel =
  //     MethodChannel('plugins.flutter.io/shared_preferences');
  // if (mthodChannel != null) {
  //   mthodChannel.setMethodCallHandler((MethodCall methodCall) async {
  //     if (methodCall.method == 'getAll') {
  //       return <String, dynamic>{}; // set initial values here if desired
  //       // ignore: unnecessary_null_comparison
  //     }
  //     return null;
  //   });
  // }

  await Get.putAsync(() => GlobalConfigService().init());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
