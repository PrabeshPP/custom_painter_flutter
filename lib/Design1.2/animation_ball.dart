import 'package:flutter/material.dart';

class AnimationBall extends StatefulWidget {
  final Animation<double> animation;
  final Animation<double> animation1;
  const AnimationBall(
      {Key? key, required this.animation, required this.animation1})
      : super(key: key);

  @override
  _AnimationBallState createState() => _AnimationBallState();
}

class _AnimationBallState extends State<AnimationBall> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
            offset: Offset(0, widget.animation.value),
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset(
                "assets/ball.png",
                fit: BoxFit.cover,
                color: Colors.pink,
              ),
            )),
        Transform(
          transform: Matrix4.skewX(0.0)
            ..rotateY(25)
            ..rotateX(30),
          child: Opacity(
            opacity: widget.animation1.value,
            child: Padding(
              padding:const EdgeInsets.only(top: 42.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 95, 91, 91),
                    shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
