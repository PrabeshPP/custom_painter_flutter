import 'package:custom_painter_flutter/Design1.1/mainPage1.dart';
import 'package:custom_painter_flutter/Design1.2/mainpage2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      
    );
  }
}
