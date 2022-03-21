import 'package:dropcount/components/drawer.dart';
import 'package:dropcount/screens/AboutPage.dart';
import 'package:dropcount/screens/Dashboard.dart';
import 'package:dropcount/screens/Settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? _selectedGender=null;

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> ddl = ["About US", "Settings", "Dashboard"];
  return ddl.map(
          (value) =>
          DropdownMenuItem(
            value: value,
            child: Text(value),
          )
  ).toList();
}


class AppNavbar extends StatelessWidget with PreferredSizeWidget {
  final int streak;
  const AppNavbar({Key? key, this.streak = 0}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/drop.png',
                    width: 17,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'DropCount',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(111, 111, 111, 1),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 220, 220, 220)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(children: [
                      DropdownButton(
                        value: _selectedGender,
                        items: _dropDownItem(),
                        onChanged: (value){
                          _selectedGender=value as String?;
                          switch(value){
                            case "Settings" :
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Settings()),
                              );
                              break;
                            case "About US" :
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AboutPage()),
                              );
                              break;
                            case "Dashboard" :
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Dashboard()),
                              );
                              break;

                          }
                        },
                        hint: Text(''),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(
                            'assets/images/drop.png',
                            width: 15,
                          )),
                      Text(
                        streak.toString(),
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(111, 111, 111, 1),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(
                            'assets/images/userIcon.png',
                            width: 25,
                          ))
                    ]),
                  ),
                ],
              ),
            ]));
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
