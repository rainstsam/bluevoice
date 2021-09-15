import 'package:get/get.dart';

import 'controller.dart';

class ScandiviceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScandiviceController>(() => ScandiviceController());
  }
}
