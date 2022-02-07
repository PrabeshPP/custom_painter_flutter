import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          MyTab(name: "Nearby", isSelected: false),
          MyTab(name: "Recent", isSelected: true),
          MyTab(name: "Notice", isSelected: false)
        ],
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  final String name;
  final bool isSelected;
  const MyTab({Key? key, required this.name, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(name,
          style: TextStyle(
            color: isSelected?Colors.black:Colors.black38,
            fontWeight: isSelected?FontWeight.bold:FontWeight.normal,
            fontSize: isSelected?16:12
          ),),
          Container(
            height: 5,
            width: 12,
            decoration: BoxDecoration(
                color: isSelected ? Colors.red : Colors.transparent,
                borderRadius: BorderRadius.circular(4.0)),
          )
        ],
      ),
    );
  }
}
