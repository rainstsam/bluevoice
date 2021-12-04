import 'package:bluevoice/app/modules/play/controller.dart';
import 'package:get/get.dart';

import 'controller.dart';

class RecodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecodeController>(() => RecodeController());
    Get.lazyPut<PlayController>(() => PlayController());
  }
}
