import 'package:flutter/material.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({Key? key}) : super(key: key);

  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: SlidingCard(
        name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
        date: "4.20-30",
        assetName: "steve-johsom.jpeg",
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  const SlidingCard(
      {Key? key,
      required this.name,
      required this.date,
      required this.assetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8),
    );
  }
}
