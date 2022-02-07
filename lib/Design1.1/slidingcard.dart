// ignore_for_file: prefer_const_constructors
import 'package:custom_painter_flutter/Design1.1/tab_bar.dart';
import 'package:flutter/material.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({Key? key}) : super(key: key);

  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Tabs(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: const SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: "4.20-30",
            assetName: "assets/steve-johnson.jpeg",
          ),
        ),
      ],
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
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24, top: 14),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(32.0)),
            child: Image.asset(
              assetName,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.none,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              date,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade900)
                ),
                  onPressed: () {
                   
                  },
                  child:const Text("Reserve",
                  style: TextStyle(
                    color: Colors.white
                  ),))
            ],
          )
        ],
      ),
    );
  }
}
