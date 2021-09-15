import 'package:get/get.dart';

import 'controller.dart';

class ChoicediviceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoicediviceController>(() => ChoicediviceController());
  }
}
