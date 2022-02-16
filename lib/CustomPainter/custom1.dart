import 'package:flutter/material.dart';

class CustomPainter extends StatelessWidget {
  const CustomPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
        ),
      ),
    );
  }
}
