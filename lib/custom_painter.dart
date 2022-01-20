import 'package:flutter/material.dart';
import 'dart:math' as math;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  }

  void toggle() => animationController!.isDismissed
      ? animationController!.forward()
      : animationController!.reverse();

  @override
  Widget build(BuildContext context) {
    const double maxSlide = 225.0;
    var myDrawer = Container(
      color: Colors.blue,
    );
    var myChild = Container(
      color: Colors.yellow,
    );
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
          animation: animationController!,
          builder: (context, _) {
            double slide = maxSlide * animationController!.value;
            double scale = 1 - (animationController!.value * 0.3);
            return Stack(
              children: <Widget>[
                myDrawer,
                Transform.translate(
                  offset: Offset(maxSlide*animationController!.value,0),
                  child: Transform(
                      transform: Matrix4.identity()
                      ..setEntry(3, 2,0.001)
                        ..rotateY(-math.pi/2*animationController!.value),
                      alignment: Alignment.centerLeft,
                      child: myChild),
                )
              ],
            );
          }),
    );
  }
}
