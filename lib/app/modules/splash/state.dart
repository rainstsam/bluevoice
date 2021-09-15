/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:57:45
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-11 00:55:15
 */
import 'package:get/get.dart';

class SplashState {
  // twellcome
  final RxString _wellcome = '欢迎使用'.obs;
  set wellcome(value) => this._wellcome.value = value;
  get wellcome => this._wellcome.value;
}
