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
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          
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
                          color: Color.fromARGB(255, 95, 91, 91),
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(left: 12.0,right: 12.0),
                child:  Text(
                  "What are you \n working on ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const Text("Dribble is where designers get \ninspired and hired",
              style: TextStyle(
                fontSize: 12.0
              ),),

              Container(
                height: 50,
                width: 250,
                decoration:  BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(8.0)

                ),
                child:const Center(
                  child:  Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                  ),
                ),
              ),
             InkWell(
               onTap: (){
                 
               },
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:const [
                  Text("I already have an account",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0
                  ),),
                  Icon(Icons.arrow_forward,
                  color: Colors.blueAccent,)
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
