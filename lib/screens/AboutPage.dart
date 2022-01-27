import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Text('Hello World', style: TextStyle(fontSize: 20),),
              // Text('Hello World', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.pink),),
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Like water meter attached in motor side, telling amount of water supplied. We can make a device which can be attached at output side (faucet,shower,etc.) By which we can control the the amount of water to be supplied. For example - If we have to take bath we can allocate a suitable amount of water for it. This can reduce water wastage. Extras on it - we can make database telling user how much water he used and wasted ,also detecting leakage if there abnormal amount of water usage. And also common things like heating water,tds meter,etc. In Future if this idea succeeded we(with government help) can also make new system of water allocation in which we can fix the amount water per household.',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(65, 65, 65, 1),
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ));
  }
}
