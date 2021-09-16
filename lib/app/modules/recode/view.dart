/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-10 23:49:04
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-16 10:21:34
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
// import 'widgets/widgets.dart';

class RecodePage extends GetView<RecodeController> {
  // 内容页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.goHome, icon: Icon(Icons.arrow_back)),
        title: Text("监听录制"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: controller.state.isHide ? 0.0 : 1.0,
              child: Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child:Obx(() => Text(controller.state.costTime.toString())) T
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTapDown: (x) => controller.startRecord(),
              onTapUp: (x) => controller.stopRecord(),
              onTapCancel: () => controller.cancelRecord(),
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.volume_up),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              child: Icon(Icons.play_arrow),
              onPressed: () => controller.startPlayer(controller.state.records[controller.state.records.length - 1]),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // ignore: deprecated_member_use
                  return RaisedButton(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(16),
                        child: Text(controller.state.records[index].toString())),
                    onPressed: () {
                      controller.startPlayer(controller.state.records[index]);
                    },
                  );
                },
                itemCount: controller.state.records.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
