/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-13 14:47:19
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-23 19:42:06
 */
// import 'package:bluevoice/app/modules/play/widgets/play_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';
import 'list.dart';


class PlayList extends GetView<PlayController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.state.files.isEmpty) {
          return Container(
              child: SizedBox(
                height: 60,
                child: Text('没有找到录音'),
           
              ),
            );
          
        } else {
          return      SizedBox(
          height: 460,
          
           child:ListView.builder(
            //  scrollDirection: Axis.vertical,
            shrinkWrap: true,
              itemCount: controller.state.files.length, 
              itemBuilder: (context, index) {
                return  FileItem(
                    file: controller.state.files[index],

                  );
              }
            ));
        }
      }
      
      
      
      
      
      
      //  => 
      //     ? 
            // :
 
          // : Column(
          //     children:
          //         controller.state.files.map<Widget>((item) {
          //       List<Widget> widgets = <Widget>[
          //         FileItem(
          //           file: item,
          //           // onItemClick:()=> controller.state.file = item
          //           // index:item.key
          //         ),
          //         Divider(height: 1),
          //       ];
          //       return Column(
          //         children: widgets,
          //       );
          //     }).toList(),
          //   ),
    );
  }

}
