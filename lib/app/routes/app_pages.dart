/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-05 23:21:09
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 01:47:06
 */
import 'package:bluevoice/app/modules/splash/index.dart';
import 'package:get/get.dart';

import 'package:bluevoice/app/modules/scandivice/index.dart';
import 'package:bluevoice/app/modules/choicedivice/index.dart';
import 'package:bluevoice/app/modules/tasklist/index.dart';
import 'package:bluevoice/app/modules/addtask/index.dart';
import 'package:bluevoice/app/modules/edittask/index.dart';
import 'package:bluevoice/app/modules/recode/index.dart';
import 'package:bluevoice/app/modules/play/index.dart';
import 'package:bluevoice/app/modules/taskdetail/index.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Paths.Splash;

  static final List<GetPage> routes = [
    GetPage(
      name: Paths.Splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Paths.Scandivice,
      page: () => ScandivicePage(),
      binding: ScandiviceBinding(),
    ),
    GetPage(
      name: Paths.Choicedivice,
      page: () => ChoicedivicePage(),
      binding: ChoicediviceBinding(),
    ),
    GetPage(
      name: Paths.Tasklist,
      page: () => TasklistPage(),
      binding: TasklistBinding(),
    ),
    GetPage(
      name: Paths.AddTask,
      page: () => AddTaskPage(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: Paths.EditTask,
      page: () => EdittaskPage(),
      binding: EdittaskBinding(),
    ),
    GetPage(
      name: Paths.Recode,
      page: () => RecodePage(),
      binding: RecodeBinding(),
    ),
    GetPage(
      name: Paths.Play,
      page: () => PlayPage(),
      binding: PlayBinding(),
    ),
    GetPage(
      name: Paths.Taskdetail,
      page: () => TaskdetailPage(),
      binding: TaskdetailBinding(),
    ),
  ];
}
