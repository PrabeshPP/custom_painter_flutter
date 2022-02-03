import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Bar"),
      ),
      body: Container(
        color: _color,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _color = Colors.red;
            });
          },
        ),
      ),
    );
  }
}
