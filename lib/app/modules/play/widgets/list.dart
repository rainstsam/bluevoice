/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:39
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-24 01:27:04
 */

// import org.apache.commons.lang3.StringUtils;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../index.dart';

class FileItem extends GetView<PlayController> {
  final String file;
  // final int index;
  final VoidCallback? onItemClick;
  final ValueChanged<bool>? onCheckBoxChanged;

  FileItem({
    Key? key,
    this.onItemClick,
    this.onCheckBoxChanged,
    required this.file,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: file != controller.state.file ? Colors.grey[100]: Colors.blue,
        
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: _buildRow(context),
    ));
  }

  Widget _buildRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        child: InkWell(
          onTap: () => controller.setPlayfile(file),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                
                height: 20,
                child: Text(file.substring(file.length - 25)),
              ),

              Container(
                width: 5,
                height: 20,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        actionExtentRatio: 0.20, // 侧滑按钮所占的宽度
        enabled: true, //
        actions: <Widget>[

          IconSlideAction(
            caption: '优化',
            color: Colors.indigo,
            icon: Icons.record_voice_over_outlined,
            onTap: () => print('优化'),
          ),
        ],

        secondaryActions: [
          IconSlideAction(
            caption: '删除',
            color: Colors.red,
            icon: Icons.delete_forever,
            onTap: () => controller.deletefile(file),
            closeOnTap: false,
          ),

        ],
      ),
    );
  }
}
