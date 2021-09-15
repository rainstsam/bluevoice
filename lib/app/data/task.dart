/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 17:03:02
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 03:18:19
 */

class TaskItem {
  int? id;
  String? taskname;
  String? taskdetail;
  TaskItem({
    this.id,
    this.taskname,
    this.taskdetail,
  });
  factory TaskItem.fromJson(Map<dynamic, dynamic> json) => TaskItem(
        id: json["id"],
        taskname: json["taskname"],
        taskdetail: json["taskdetail"],
      );
  Map<String, dynamic> toMap() {
    return {'id': id, 'taskname': taskname, 'taskdetail': taskdetail};
    // return {'taskname': taskname, 'taskdetail': taskdetail};
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "taskname": taskname, "taskdetail": taskdetail};
    // return {'taskname': taskname, 'taskdetail': taskdetail};
  }

  @override
  String toString() {
    return '{"id":$id,"taskname":"$taskname","taskdetail":"$taskdetail"}';
  }
}

class TasklistItems {
  List<TaskItem>? items;
  TasklistItems({this.items});
  factory TasklistItems.fromJson(Map<String, dynamic> json) => TasklistItems(
      items: json["items"] == null
          ? []
          : List<TaskItem>.from(
              json["items"].map((x) => TaskItem.fromJson(x))));
}
