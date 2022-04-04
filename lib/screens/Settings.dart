// ignore_for_file: unnecessary_new
import 'package:dropcount/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/app_bar.dart';

class Settings extends StatelessWidget {
  final String name, email;
  final int volume;
  const Settings(
      {Key? key,
      this.name = 'user',
      this.email = 'user@gmail.com',
      this.volume = 0})
      : super(key: key);
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
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Dashboard()),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          '<',
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.lato(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            color: const Color.fromRGBO(
                                                65, 65, 65, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Settings',
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.roboto(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            const Color.fromRGBO(65, 65, 65, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/userIcon.png')
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Update'),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            primary: const Color.fromRGBO(
                                                55, 163, 241, 1),
                                          ))),
                                  Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Remove'),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            primary: Colors.white,
                                            onPrimary: const Color.fromRGBO(
                                                147, 147, 147, 1),
                                          ))),
                                ],
                              )),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Full Name',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color:
                                            const Color.fromRGBO(65, 65, 65, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      initialValue: name,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Username',
                                      )),
                                  Container(
                                    height: 30,
                                  ),
                                  Text(
                                    'Email',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color:
                                            const Color.fromRGBO(65, 65, 65, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      initialValue: email,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Email',
                                      )),
                                  Container(
                                    height: 30,
                                  ),
                                  Text(
                                    'Tank Volume(in Liters)',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color:
                                            const Color.fromRGBO(65, 65, 65, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      initialValue: volume.toString(),
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Volume of Tank',
                                      )),
                                  Container(
                                    height: 30,
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  right: 20),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('Save'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                    primary:
                                                        const Color.fromRGBO(
                                                            55, 163, 241, 1),
                                                  ))),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('Sign Out'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                    primary: Colors.redAccent,
                                                  ))),
                                        ],
                                      )),
                                ],
                              ))
                        ])))));
  }
}
