import 'package:flutter/material.dart';

class DragableCard extends StatefulWidget {
  const DragableCard({Key? key}) : super(key: key);

  @override
  _DragableCardState createState() => _DragableCardState();
}

class _DragableCardState extends State<DragableCard> {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Card(child: FlutterLogo()),
      ),
    );
  }
}
