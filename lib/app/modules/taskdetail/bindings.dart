import 'package:get/get.dart';

import 'controller.dart';

class TaskdetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskdetailController>(() => TaskdetailController());
  }
}
