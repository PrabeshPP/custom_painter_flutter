import 'package:custom_painter_flutter/AnimatedBuilder.dart';
import 'package:custom_painter_flutter/GestureDetector.dart';
import 'package:custom_painter_flutter/animatedCont.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogoApp1(),
      
    );
  }
}
