import 'package:flutter/material.dart';

class Page101 extends StatelessWidget {
  const Page101({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  Column(
          children: [
            Image(image: const AssetImage("assets/steve-johnson.jpeg",
            ),
            height:MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width*0.5,
            alignment: Alignment(-1.6, 0),
            fit: BoxFit.none,
            
              ),
          ],
        ),
        
      ),
    );
  }
}