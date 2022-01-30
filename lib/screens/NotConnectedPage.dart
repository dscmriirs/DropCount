import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotConnected extends StatelessWidget {
  const NotConnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 300.0,
              alignment: Alignment.center,
              child: Image.asset('assets/images/notConnected.png')),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
            width: double.infinity,
            child: Text('Not Connected',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(74, 123, 197, 1),
                )),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            width: double.infinity,
            child: Text('Please connect your device on the same wifi network',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(74, 123, 197, 1),
                )),
          ),
        ],
      ),
    );
  }
}
