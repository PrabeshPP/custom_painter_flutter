// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:custom_painter_flutter/Design1.1/slidingcard.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DesignPage1 extends StatelessWidget {
  const DesignPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          SafeArea(child: SlidingCardsView()),
          ExhibitionBottomSheet()
        ],
      ),
    );
  }
}

const double minHeight = 120.0;

class ExhibitionBottomSheet extends StatefulWidget {
  const ExhibitionBottomSheet({Key? key}) : super(key: key);

  @override
  State<ExhibitionBottomSheet> createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double get maxHeight => MediaQuery.of(context).size.height;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    super.initState();
  }

  double? lerp(double min, double max) {
    return lerpDouble(min, max, controller.value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Positioned(
            height: lerp(minHeight, maxHeight),
            right: 0,
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              onTap: _ontoggle,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 13, 42, 66),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.0))),
                child: Stack(
                  children: [
                    MenuButton(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _ontoggle() {
    final bool isOpen = controller.status == AnimationStatus.completed;
    controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    controller.value -= details.primaryDelta! /
        maxHeight; //<-- Update the _controller.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy /
        maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      controller.fling(
          velocity:
              math.max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      controller.fling(
          velocity:
              math.min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      controller.fling(
          velocity: controller.value < 0.5
              ? -2.0
              : 2.0); //<-- or just continue to whichever edge is closer
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 0,
      bottom: 30,
      child: Icon(
      Icons.menu,
      color: Colors.white,
      size: 28,
    ));
  }
}
