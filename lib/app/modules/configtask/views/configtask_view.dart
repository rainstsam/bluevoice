import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/configtask_controller.dart';

class ConfigtaskView extends GetView<ConfigtaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConfigtaskView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConfigtaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
