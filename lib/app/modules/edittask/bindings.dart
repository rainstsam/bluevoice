import 'package:get/get.dart';

import 'controller.dart';

class EdittaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EdittaskController>(() => EdittaskController());
  }
}
