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
    return Container(
      margin: EdgeInsets.only(top: 12.0),
      height: MediaQuery.of(context).size.height * 0.29,
      width: MediaQuery.of(context).size.width * 0.5,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Colors.white,
            child: Transform.translate(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Transform(
              transform: Matrix4.skewX(0.0)
                ..rotateY(25)
                ..rotateX(30),
              child: Opacity(
                opacity: widget.animation1.value,
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
      ),
    );
  }
}
