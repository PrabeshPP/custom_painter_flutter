import 'package:custom_painter_flutter/Design1.1/slidingcard.dart';
import 'package:flutter/material.dart';

class DesignPage1 extends StatelessWidget {
  const DesignPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prabesh Bista"),
      ),
      
      body: const SafeArea(child:  SlidingCardsView()),
     
    );
  }
}
