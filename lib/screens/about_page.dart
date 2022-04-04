// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/app_bar.dart';
import 'dashboard.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const AppNavbar(),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                '<',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.lato(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: const Color.fromRGBO(65, 65, 65, 1),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'About Us',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(65, 65, 65, 1),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      'Like water meter attached in motor side, telling amount of water supplied. We can make a device which can be attached at output side',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(65, 65, 65, 1),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      '(faucet,shower,etc.) By which we can control the the amount of water to be supplied. For example - If we have to take bath we can allocate a suitable amount of water for it.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(65, 65, 65, 1),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      'This can reduce water wastage. Extras on it - we can make database telling user how much water he used and wasted ,also detecting leakage if there abnormal amount of water usage. And also common things like heating water,tds meter,etc. In Future if this idea succeeded we(with government help) can also make new system of water allocation in which we can fix the amount water per household.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(65, 65, 65, 1),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                      child: Row(
                        children: [
                          Text(
                            'Terms & Conditions',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(65, 65, 65, 1),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Privacy',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(65, 65, 65, 1),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ))));
  }
}
