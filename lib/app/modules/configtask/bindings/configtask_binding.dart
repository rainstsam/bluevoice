import 'package:get/get.dart';

import '../controllers/configtask_controller.dart';

class ConfigtaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfigtaskController>(
      () => ConfigtaskController(),
    );
  }
}
