import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLightOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Bar"),
      ),
      body: Column(
        children: [
          Container(
            alignment: FractionalOffset.center,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Icon(Icons.light,
                color: isLightOn ? Colors.yellow : Colors.black, size: 150),
          ),
          GestureDetector(
            
            onTap: () {
              setState(() {
                isLightOn = !isLightOn;
              });
            },
            child: Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.3,
              child: isLightOn
                  ? const Center(child: Text("OFF"))
                  : const Center(child: Text("ON")),
            ),
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}
