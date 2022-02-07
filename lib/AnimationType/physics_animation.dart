import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DragableCard extends StatefulWidget {
  const DragableCard({Key? key}) : super(key: key);

  @override
  _DragableCardState createState() => _DragableCardState();
}

class _DragableCardState extends State<DragableCard>
    with SingleTickerProviderStateMixin {
  Alignment _dragElement = Alignment.center;
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controller.addListener(() {
      setState(() {
        _dragElement = animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _runAnimation(Offset pixelPerSecond, Size size) {
    animation = controller
        .drive(AlignmentTween(begin: _dragElement, end: Alignment.center));

    final unitsPerSecondX = pixelPerSecond.dx / size.width;
    final unitsPerSecondY = pixelPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    controller.animateWith(simulation);

    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onPanDown: (details) {
          controller.stop();
        },
        onPanUpdate: (details) {
          setState(() {
            _dragElement += Alignment(details.delta.dx / (size.width / 2),
                details.delta.dy / (size.width / 2));
          });
        },
        onPanEnd: (details) {
          _runAnimation(details.velocity.pixelsPerSecond, size);
        },
        child: Align(
          alignment: _dragElement,
          child: const Card(child: FlutterLogo()),
        ),
      ),
    );
  }
}
