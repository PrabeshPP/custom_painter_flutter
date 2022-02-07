import 'package:custom_painter_flutter/AnimationType/physics_animation.dart';
import 'package:custom_painter_flutter/Design1.1/SlidingCard.dart';
import 'package:custom_painter_flutter/Implicit_Animations/fade_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SlidingCardsView(),
      
    );
  }
}
