// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/AppBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './Settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final User? _username = FirebaseAuth.instance.currentUser;
  final data = {
    "01-01-1970": 0,
    "12-3-22": 65,
    "13-3-22": 56,
    "14-3-22": 45,
    "15-3-22": 56,
    "16-3-22": 32,
    "17-3-22": 22,
    "18-3-22": 10,
    "19-3-22": 15,
    "25-03-2022": 0,
    "26-03-2022": 4312
  };
  final _waterSaved = 30;
  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      SafeArea(
          child: Scaffold(
              appBar: AppNavbar(),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      child: Text(
                        'Good Morning',
                        style: GoogleFonts.roboto(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      child: Text(
                        _username!.displayName.toString(),
                        style: GoogleFonts.roboto(
                            fontSize: 28, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your Progress',
                        style: GoogleFonts.roboto(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3))
                          ]),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Great !',
                                  style: GoogleFonts.roboto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'You saved water for ' +
                                      (_waterSaved / 40).ceil().toString() +
                                      ' houses',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 5.0,
                            percent: _waterSaved / 40,
                            center: Text(
                              _waterSaved.toString() + "%",
                              style: GoogleFonts.roboto(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            progressColor:
                                const Color.fromRGBO(108, 229, 232, 1.0),
                            backgroundColor: Colors.grey.withOpacity(0.2),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(245, 245, 245, 1.0),
                        ),
                        child: DefaultTabController(
                            length: 3,
                            child: TabBar(
                                indicatorColor: Colors.transparent,
                                unselectedLabelColor:
                                    Color.fromRGBO(177, 176, 190, 1),
                                indicator: BoxDecoration(
                                    color: Color.fromRGBO(55, 163, 241, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                tabs: [
                                  Tab(
                                      child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Daily',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                  )),
                                  Tab(
                                      child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Weekly',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                  )),
                                  Tab(
                                      child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Monthly',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                  )),
                                ]))),
                  ],
                ),
              )))),
      Settings()
    ]);
  }
}
