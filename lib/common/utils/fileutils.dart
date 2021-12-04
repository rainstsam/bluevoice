import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:date_format/date_format.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// 在指定路径basepath下创建指定后缀名文件suffix，文件名为基于时间戳生成的唯一uuid
Future<String?> strogeFile(String basepath, {String? suffix}) async {
  suffix ??= 'tmp';
  if (!suffix.startsWith('.')) {
    suffix = '.$suffix';
  }
  // final filepath = await getApplicationDocumentsDirectory();
  // var year = DateTime.now().year.toString();
  // var month = DateTime.now().month.toString();
  // var day =  DateTime.now().day.toString();
  // var hour = DateTime.now().hour.toString();
  // var minute = DateTime.now().minute.toString();
  // var second = DateTime.now().second.toString();
  // var millisecond = DateTime.now().millisecond.toString();
  // var data = DateTime.now().millisecondsSinceEpoch.toString();
  // var formatdata = DateTime.now().toString();
  var data = formatDate(
      DateTime.now(), [yyyy, "-", mm, "-", dd, "-", HH, "_", nn, "_", ss]);
  var uuid = Uuid();
  // var fileurl = '${join(basepath, year+'-'+month+ '-' + day+ '-' + hour + '：' + minute + '：' + second + '-' + millisecond)}$suffix';
  var fileurl = '${join(basepath, data)}$suffix';
  ;
  // var parent = dirname(fileurl);
  requestPermission();
  try {
    if (!kIsWeb) {
      // Directory(parent).createSync(recursive: true);
      File(fileurl).createSync(recursive: true);
      return fileurl;
    }
  } catch (e) {
    return 'some err';
  }
}

// 生成文件夹
Future<String> saveVoiceDirectory(String url) async {
  requestPermission();
  // final filepath = '/storage/emulated/0/org.rianstsam.bluevoice';
  // var basedir = Directory(filepath);
  final dir = await getExternalStorageDirectory();
  var filepath = dir!.path;
  var file = Directory(filepath + "/" + url);
  try {
    bool exists = await file.exists();
    if (!exists) {
      await file.create();
      print("创建成功");
    } else {
      print("已存在");
    }
  } catch (e) {
    print(e);
  }
  return file.path.toString();
}

//  获取文件访问权限
Future requestPermission() async {
  if (await Permission.contacts.request().isGranted) {
    // Either the permission was already granted before or the user just granted it.
  }
  // You can request multiple permissions at once.
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();
  print(statuses[Permission.storage]);
}

Future<List> getFileList(path) async {
  // final dir = await getApplicationDocumentsDirectory();
  final dir = Directory(path);
  List<String> fileslist = [];
  print(dir.existsSync()); // <---- it also print: false
  var files = dir.listSync().toList();
  files.forEach((e) => fileslist.add(e.path));
  return fileslist;
}

Future delDir(String path) async {
  requestPermission();
  // final filepath = '/storage/emulated/0/org.rianstsam.bluevoice';
  // final filepath = await getApplicationDocumentsDirectory();
  final dir = await getExternalStorageDirectory();
  var filepath = dir!.path;
  var voicedir = Directory(filepath + "/" + path);
  // final dir = Directory(path);
  voicedir.deleteSync(recursive: true);
}

Future delFile(String path) async {
  requestPermission();
  var dir = Directory(path);
  // final dir = Directory(path);
  dir.deleteSync(recursive: true);
}

Future<Uint8List> readFile(String path) async {
  requestPermission();
  var file = File(path);
  // final dir = Directory(path);
  Uint8List bytes = file.readAsBytesSync();
  return bytes;
}
