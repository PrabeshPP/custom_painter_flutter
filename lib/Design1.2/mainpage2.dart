import 'package:custom_painter_flutter/Design1.2/animation_ball.dart';
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
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 30).animate(controller);

    animation1 = Tween<double>(begin: 0.07, end: 0.3).animate(controller);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimationBall(animation: animation, animation1: animation1),
              const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  "What are you \n  working on ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Dribble is where designers get \n             inspired and hired.",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "I already have an account",
                        style: TextStyle(color: Colors.blue, fontSize: 15.0),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blueAccent,
                      )
                    ],
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
