// ignore_for_file: prefer_const_constructors
import 'package:custom_painter_flutter/Design1.1/tab_bar.dart';
import 'package:flutter/material.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({Key? key}) : super(key: key);

  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController? pageController;
  double? pageOffset = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController!.addListener(() {
      setState(() {
        pageOffset = pageController!.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            "Book My Show",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        const Tabs(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: PageView(
            controller: pageController,
            children: [
              SlidingCard(
                name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
                date: "4.20-30",
                assetName: "assets/steve-johnson.jpeg",
                pageOffset: pageOffset,
              ),
              SlidingCard(
                name: 'Dawn District,Guandong HonkKong and Macao',
                date: "4.28-31",
                assetName: "assets/rodion-kutsaev.jpeg",
                pageOffset: pageOffset! - 1,
              ),
              SlidingCard(
                name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
                date: "4.20-30",
                assetName: "assets/efe-kurnaz.jpg",
                pageOffset: pageOffset! - 1,
              ),
            ],
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
  final double? pageOffset;
  const SlidingCard(
      {Key? key,
      required this.pageOffset,
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
              alignment: Alignment(-pageOffset!.abs(), 0),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF162A49)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)))),
                    onPressed: () {},
                    child: const Text(
                      "Reserve",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  "\$0.00",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
