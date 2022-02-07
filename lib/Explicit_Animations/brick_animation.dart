import 'package:flutter/material.dart';
import 'dart:math' as math;

class BrickAnimation extends StatefulWidget {
  const BrickAnimation({Key? key}) : super(key: key);

  @override
  _BrickAnimationState createState() => _BrickAnimationState();
}

class _BrickAnimationState extends State<BrickAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController? controller;
  late Tween? tween;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    tween = Tween(begin: 0.0, end: 1.0);
    controller!.repeat();

    super.initState();
  }

  //!Brick 1
  Animation get animOne => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.0, 0.125, curve: Curves.linear)));

  Animation get animTwo => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.125, 0.25, curve: Curves.linear)));

  //!Brick 2

  Animation get animThree => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.25, 0.375, curve: Curves.linear)));

  //!Brick 3

  Animation get animFour => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.375, 0.5, curve: Curves.linear)));

  //!Brick 4

  Animation get animFive => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.5, 0.625, curve: Curves.linear)));

  Animation get animSix => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.625, 0.750, curve: Curves.linear)));

  //!Brick 3
  Animation get animSeven => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.750, 0.875, curve: Curves.linear)));

  //! Brick 2

  Animation get animEight => tween!.animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(0.875, 1.0, curve: Curves.linear)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBrick(
            animation: [animOne, animTwo],
            controller: controller!,
            marginLeft: 0.0,
            alignment: Alignment.centerLeft,
            isClockWise: true,
          ),
          AnimatedBrick(
            animation: [animThree, animEight],
            controller: controller!,
            marginLeft: 0.0,
            isClockWise: false,
          ),
          AnimatedBrick(
            animation: [animFour, animSeven],
            controller: controller!,
            marginLeft: 30.0,
            isClockWise: true,
          ),
          AnimatedBrick(
            animation: [animFive, animSix],
            controller: controller!,
            marginLeft: 30.0,
            isClockWise: false,
          )
        ],
      )),
    );
  }
}

class AnimatedBrick extends AnimatedWidget {
  final AnimationController controller;
  final double marginLeft;
  final List<Animation> animation;
  final Alignment alignment;
  final bool isClockWise;
  const AnimatedBrick(
      {Key? key,
      required this.isClockWise,
      required this.animation,
      required this.controller,
      required this.marginLeft,
      this.alignment = Alignment.centerRight})
      : super(key: key, listenable: controller);

  Matrix4 clockWise(animaiton) =>
      Matrix4.rotationZ(animaiton.value * math.pi * 2.0 * 0.5);
  Matrix4 anticlockWise(animaiton) =>
      Matrix4.rotationZ(-(animaiton.value * math.pi * 2.0 * 0.5));

  @override
  Widget build(BuildContext context) {
    var firstTransFormation;
    var secondTransFormation;
    if (isClockWise) {
      firstTransFormation = clockWise(animation[0]);
       secondTransFormation = clockWise(animation[1]);
    } else {
       firstTransFormation = anticlockWise(animation[0]);
       secondTransFormation = anticlockWise(animation[1]);
    }

    return Transform(
        alignment: alignment,
        transform: firstTransFormation,
        child: Transform(
          transform: secondTransFormation,
          alignment: alignment,
          child: Brick(
            margin: marginLeft,
          ),
        ));
  }
}

class Brick extends StatelessWidget {
  final double margin;
  const Brick({Key? key, this.margin = 15.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.teal),
      height: 10,
      width: 40,
    );
  }
}
