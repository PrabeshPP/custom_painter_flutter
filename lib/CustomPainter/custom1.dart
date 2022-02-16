import 'package:flutter/material.dart';

class CustomPainter1 extends StatelessWidget {
  const CustomPainter1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.red,
          ),
          clipper: MyCustomClipper(),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    // path.moveTo(0, size.height * 0.33);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        size.width/2, size.height, size.width, size.height / 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
