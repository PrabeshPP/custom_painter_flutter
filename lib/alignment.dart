import 'package:flutter/material.dart';

class Page101 extends StatelessWidget {
  const Page101({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image(image:const AssetImage("assets/steve-johnson.jpeg"),
      height: MediaQuery.of(context).size.height*0.55,
      width: MediaQuery.of(context).size.width,),
      
    );
  }
}