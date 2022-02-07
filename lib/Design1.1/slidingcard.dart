import 'package:flutter/material.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({Key? key}) : super(key: key);

  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.55,
      child: const SlidingCard(
        name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
        date: "4.20-30",
        assetName: "assets/steve-johnson.jpeg",
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
    return  Card(
      color: Colors.red,
      margin:const  EdgeInsets.only(left: 8,right: 8,bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      child: Column(
        children: [
        Image.asset(assetName,
      
      height: MediaQuery.of(context).size.height*0.3,
      fit: BoxFit.none,),
     const SizedBox(
        height: 8,
      ),
      Expanded(child: 
      Container())
        ],
      ),
    );
  }
}
