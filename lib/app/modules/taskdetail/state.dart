import 'package:get/get.dart';

class TaskdetailState {
  // title
  final _title = "".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;

    final _basepash = ''.obs;
  set basepash(value) => this._basepash.value = value;
  get basepash => this._basepash.value;
}
