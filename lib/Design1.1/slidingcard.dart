import 'package:flutter/material.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({Key? key}) : super(key: key);

  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackWidth: double.infinity,
      fallbackHeight: MediaQuery.of(context).size.height * 0.55,
    );
  }
}
