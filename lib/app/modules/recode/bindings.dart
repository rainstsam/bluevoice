import 'package:get/get.dart';

import 'controller.dart';

class RecodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecodeController>(() => RecodeController());
  }
}
