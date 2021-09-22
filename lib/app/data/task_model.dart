/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-22 00:15:26
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-22 00:30:44
 */
import 'task_database.dart';

class TaskModel {
/*
{
  "curPage": 1,
  "datas": [
    {
      "completeDate": null,
      "completeDateStr": "",
      "content": "",
      "date": 1607270400000,
      "dateStr": "2020-12-07",
      "id": 24902,
      "priority": 0,
      "status": 0,
      "title": "SSSS",
      "type": 0,
      "userId": 82504
    }
  ],
  "offset": 0,
  "over": true,
  "pageCount": 1,
  "size": 20,
  "total": 4
} 
*/

  late int? curPage;
  late List<Task>? datas;
  late int? offset;
  late bool? over;
  late int? pageCount;
  late int? size;
  late int? total;

  TaskModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });
  TaskModel.fromJson(Map<String, dynamic> json) {
    curPage = json["curPage"]?.toInt();
    if (json["datas"] != null) {
      var v = json["datas"];
      // ignore: deprecated_member_use
      List<Task> arr0 = [];
      v.forEach((v) {
        arr0.add(Task.fromJson(v));
      });
      datas = arr0;
    }
    offset = json["offset"]?.toInt();
    over = json["over"];
    pageCount = json["pageCount"]?.toInt();
    size = json["size"]?.toInt();
    total = json["total"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["curPage"] = curPage;
    if (datas != null) {
      var v = datas;
      var arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data["datas"] = arr0;
    }
    data["offset"] = offset;
    data["over"] = over;
    data["pageCount"] = pageCount;
    data["size"] = size;
    data["total"] = total;
    return data;
  }
}
