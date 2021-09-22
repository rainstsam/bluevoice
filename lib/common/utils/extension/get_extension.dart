/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-21 23:22:03
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-21 23:34:00
 */
import 'package:get/get.dart';
import 'package:bluevoice/common/widget/loading_dialog.dart';

extension GetExtension on GetInterface {
  dismiss() {
    var isOpen = false;
    isOpen = Get.isDialogOpen!;
    if (isOpen) {
      Get.back();
    }
  }

  loading() {
        var isOpen = false;
    isOpen = Get.isDialogOpen!;
    if (isOpen) {
      Get.back();
    }
    Get.dialog(LoadingDialog());
  }
}
