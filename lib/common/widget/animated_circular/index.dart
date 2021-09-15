/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-09-06 17:06:59
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-06 17:12:47
 */

import 'package:flutter/material.dart';
import './animated_rotation_box.dart';
import './gradient_circular_progress_indicator.dart';

class AnimatedCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedRotationBox(
      stokeWidth: 8.0,
      child: GradientCircularProgressIndicator(
        colors: [Colors.blue, Colors.white, Colors.blue, Colors.grey],
        radius: 60.0,
        stokeWidth: 5.0,
        strokeCapRound: true,
        backgroundColor: Colors.transparent,
        value: 1.0,
        stops: [0.3, 0.5, 0.3, 0.5],
      ),
    );
  }
}
