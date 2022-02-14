import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation1;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween<double>(begin: 0, end: 30).animate(controller);

    animation1 = Tween<double>(begin: 0.1, end: 0.6).animate(controller);
    animation.addListener(() {
      setState(() {});
    });

    animation.addStatusListener((status) {
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Transform.translate(
                  offset: Offset(0, animation.value),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/ball.png",
                        fit: BoxFit.cover,
                        color: Colors.pink,
                      ),
                    ),
                  )),
              Transform(
                transform: Matrix4.skewX(0.0)
                  ..rotateY(25)
                  ..rotateX(30),
                child: Opacity(
                  opacity: animation1.value,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.height * 0.15) + 90,
                        right: MediaQuery.of(context).size.width * 0.17),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 54, 46, 46),
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
