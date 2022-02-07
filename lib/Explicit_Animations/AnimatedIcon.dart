import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        ColorTween(begin: Colors.red, end: Colors.teal).animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo11(animation: animation);
  }
}

class AnimatedLogo11 extends AnimatedWidget {
  const AnimatedLogo11({Key? key, required Animation<Color?> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Color?>;

    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
