import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appBar extends StatelessWidget with PreferredSizeWidget {
  final int streak;
  const appBar({Key? key, this.streak = 0}) : super(key: key);
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
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
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
                          padding: EdgeInsets.symmetric(horizontal: 5),
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
