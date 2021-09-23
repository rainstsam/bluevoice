/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-19 14:11:50
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 07:42:21
 */
/*
 * Copyright 2018, 2019, 2020 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License version 3 (LGPL-V3), as published by
 * the Free Software Foundation.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Flutter-Sound.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:io';

import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Creates an path to a temporary file.
Future<String> strogeFile(String addpath, {String? suffix}) async {
  suffix ??= 'tmp';

  if (!suffix.startsWith('.')) {
    suffix = '.$suffix';
  }
  var uuid = Uuid();
  String path;
  if (!kIsWeb) {
    var tmpDir = await getExternalStorageDirectory();
    path = '${join(tmpDir!.path, addpath)}$suffix';
    var parent = dirname(path);
    Directory(parent).createSync(recursive: true);
  } else {
    path = 'uuid.v4()}$suffix';
  }
  print(path);

  return path;
}
