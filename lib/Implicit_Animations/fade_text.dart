import 'package:flutter/material.dart';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class FadeText extends StatefulWidget {
  const FadeText({Key? key}) : super(key: key);

  @override
  _FadeTextState createState() => _FadeTextState();
}

class _FadeTextState extends State<FadeText> {
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.78,
              child: Image.network(
                owlUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  opacity = 1.0;
                });
              },
              child: const Text(
                "Show details",
                style: TextStyle(color: Colors.blueAccent),
              )),
          AnimatedOpacity(
            curve: Curves.easeInExpo,
            duration: const Duration(seconds: 3),
            child: Column(
              children: const [
                Text("Type:Owl"),
                Text("Age:39"),
                Text("Emplyoment:None")
              ],
            ),
            opacity: opacity,
          )
        ],
      ),
    );
  }
}
