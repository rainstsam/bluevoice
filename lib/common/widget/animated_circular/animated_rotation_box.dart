/*
 * @Descripttion: 
 * @version: 0.1.0
 * @Author: rainstsam
 * @Date: 2021-08-09 21:30:00
 * @LastEditors: rainstsam
 * @LastEditTime: 2021-09-06 17:10:45
 */
import 'package:flutter/widgets.dart';

/// Rotates forever
class AnimatedRotationBox extends StatefulWidget {
  const AnimatedRotationBox({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.linear,
    required double stokeWidth,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  _AnimatedRotationBoxState createState() {
    return _AnimatedRotationBoxState();
  }
}

class _AnimatedRotationBoxState extends State<AnimatedRotationBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns:
            CurvedAnimation(parent: _animationController, curve: widget.curve),
        child: widget.child);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedRotationBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //print(widget.duration);
    if (oldWidget.duration != widget.duration) {
      print(widget.duration);
      _animationController.duration = widget.duration;
      _animationController.stop();
      _animationController.repeat();
    }
  }
}
