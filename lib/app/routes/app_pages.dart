/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-05 23:21:09
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-06 00:42:06
 */
import 'package:get/get.dart';

import 'package:bluevoice/app/modules/configtask/bindings/configtask_binding.dart';
import 'package:bluevoice/app/modules/configtask/views/configtask_view.dart';
import 'package:bluevoice/app/modules/home/bindings/home_binding.dart';
import 'package:bluevoice/app/modules/home/views/home_view.dart';
import 'package:bluevoice/app/modules/splash/bindings/splash_binding.dart';
import 'package:bluevoice/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.CONFIGTASK,
      page: () => ConfigtaskView(),
      binding: ConfigtaskBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
