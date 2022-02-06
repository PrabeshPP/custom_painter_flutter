import 'package:flutter/material.dart';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class FadeText extends StatefulWidget {
  const FadeText({Key? key}) : super(key: key);

  @override
  _FadeTextState createState() => _FadeTextState();
}

class _FadeTextState extends State<FadeText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 60,
          width: 80,
          child: Image.network(
            owlUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
