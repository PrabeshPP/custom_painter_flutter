// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:custom_painter_flutter/Design1.1/event.dart';
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
const double iconStartSize = 44;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

class ExhibitionBottomSheet extends StatefulWidget {
  const ExhibitionBottomSheet({Key? key}) : super(key: key);

  @override
  State<ExhibitionBottomSheet> createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double get maxHeight => MediaQuery.of(context).size.height;

  double get itemBorderRadius => lerp(8, 24)!;
  double get iconSize => lerp(iconStartSize, iconEndSize)!;

  double iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize))! +
      headerMargin!;
  double iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0)!;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    super.initState();
  }

  double? get headerMargin => lerp(20, 20 + MediaQuery.of(context).padding.top);
  double? get headerFontSize => lerp(14, 24);
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
                    const MenuButton(),
                    SheetHeader(
                        fontSize: headerFontSize!, margin: headerMargin!),
                    for(Event event in events) _buildIcon(event)
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


  Widget _buildIcon(Event event){
    int index=events.indexOf(event);
    return Positioned(
      height: iconSize,
      width: iconSize,
      top:iconTopMargin(index),
      left: iconLeftMargin(index),
      child:ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(itemBorderRadius),
          right: Radius.circular(itemBorderRadius)
        ),
        child: Image.asset(
          
          event.imageName,
          fit: BoxFit.cover,
          alignment: Alignment(lerp(1, 0)!, 0),
        ),
      ));

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

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double margin;
  const SheetHeader({Key? key, required this.fontSize, required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: margin,
        child: Text(
          "Booked Exhibition",
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500),
        ));
  }
}
