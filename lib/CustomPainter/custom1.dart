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
    path.lineTo(0.0, size.height);
    Offset firstControllPoint = Offset(size.width / 4, size.height / 2);
    Offset firstEndPoint = Offset(size.width / 2, size.height-90);
    path.quadraticBezierTo(firstControllPoint.dx, firstControllPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    Offset secondControlPoint = Offset((size.width * 3) / 4, size.height);
    ;
    Offset secondEndPoint = Offset(size.width, size.height/2);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
