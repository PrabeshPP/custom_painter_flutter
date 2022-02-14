import 'package:flutter/material.dart';

class AnimationBall extends StatefulWidget {
  final Animation<double> animation;
  final Animation<double> animation1;
  const AnimationBall({Key? key,required this.animation,required  this.animation1}) : super(key: key);

  @override
  _AnimationBallState createState() => _AnimationBallState();
}

class _AnimationBallState extends State<AnimationBall> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
