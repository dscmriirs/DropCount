import 'package:dropcount/screens/rewards.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/app_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final User? _username = FirebaseAuth.instance.currentUser;
  // ignore: prefer_typing_uninitialized_variables
  var data,
      isSelected = [true, false, false],
      avgWaterUsage = 150,
      tankLimit = 500;
  Future retrieveData() async {
    final response = await http.get(
        Uri.parse('https://drop-count-default-rtdb.firebaseio.com/test.json'));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  double waterUsed() {
    int total = 0;
    if (data != null) {
      if (isSelected[0]) {
        total = data[DateFormat('dd-MM-yyyy').format(DateTime.now())];
      } else if (isSelected[1]) {
        for (var i = 0; i < 7; i++) {
          int temp = data[DateFormat('dd-MM-yyyy')
                  .format(DateTime.now().subtract(Duration(days: i)))] ??
              0;
          total += temp;
        }
        return total / 1000;
      } else if (isSelected[2]) {
        for (var i = 0; i < 30; i++) {
          int temp = data[DateFormat('dd-MM-yyyy')
                  .format(DateTime.now().subtract(Duration(days: i)))] ??
              0;
          total += temp;
        }
      }
    }
    return total / 1000;
  }

  @override
  void initState() {
    super.initState();
    retrieveData();
    // ignore: constant_identifier_names
    const Seconds = Duration(seconds: 15);
    Timer.periodic(Seconds, (Timer t) => retrieveData());
  }

  @override
  Widget build(BuildContext context) {
    var isOk = false;
    var percentage = waterUsed() / (tankLimit * [1, 7, 30][isSelected.indexOf(true)]);
    var currentUsage = data[DateFormat('dd-MM-yyyy').format(DateTime.now())] / 1000;
    // ignore: prefer_typing_uninitialized_variables
    var safePercentage;
    if(currentUsage < avgWaterUsage) {
      safePercentage = 1 - (currentUsage / avgWaterUsage);
      isOk = true;
    } else {
      safePercentage = avgWaterUsage / currentUsage;
      isOk = false;
    }
        
    return PageView(children: [
      SafeArea(
          child: Scaffold(
              appBar: const AppNavbar(),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Welcome, ' + _username!.displayName.toString(),
                        style: GoogleFonts.roboto(
                            fontSize: 32, fontWeight: FontWeight.w700),
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
                                offset: const Offset(0, 3))
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
                                  isOk?'Great!':'Bad :(',
                                  style: GoogleFonts.roboto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  isOk?'You saved water for ' +
                                      (waterUsed() / avgWaterUsage)
                                          .ceil()
                                          .toString() +
                                      ' houses' : 'You wasted water for ' +
                                      (waterUsed() / avgWaterUsage)
                                          .ceil()
                                          .toString() +
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
                            percent: double.parse(safePercentage.toString()),
                            center: Text(
                             (safePercentage * 100)
                                      .toStringAsFixed(0) +
                                  '%',
                              style: GoogleFonts.roboto(
                                  color: (!isOk)
                                      ? Colors.red
                                      : Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            progressColor: (!isOk)
                                ? Colors.red
                                : Colors.green,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                          )
                        ],
                      ),
                    ),
                    Container(margin: const EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.center,
                      child: Text(isOk?"":"Please turn off the tap while not in use", style: GoogleFonts.roboto(
                                   color: Colors.green ,fontSize: 14, fontWeight: FontWeight.w700))
                      ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(245, 245, 245, 1.0),
                      ),
                      child: ToggleButtons(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text('Daily',
                                style: GoogleFonts.roboto(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Weekly',
                                style: GoogleFonts.roboto(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Monthly',
                                style: GoogleFonts.roboto(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                          ),
                        ],
                        selectedColor: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        constraints: BoxConstraints(
                            minWidth:
                                (MediaQuery.of(context).size.width - 36) / 3,
                            minHeight: 40),
                        fillColor: Colors.blue,
                        highlightColor: Colors.white,
                        onPressed: (int index) {
                          setState(() {
                            for (int buttonIndex = 0;
                                buttonIndex < isSelected.length;
                                buttonIndex++) {
                              if (buttonIndex == index) {
                                isSelected[buttonIndex] = true;
                              } else {
                                isSelected[buttonIndex] = false;
                              }
                            }
                          });
                        },
                        isSelected: isSelected,
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    CircularPercentIndicator(
                      radius: 168,
                      lineWidth: 15.0,
                      percent: (percentage > 1) ? 1 : percentage,
                      center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/dashboardDrop.png',
                            ),
                            Container(height: 20),
                            Text(
                              waterUsed().toStringAsFixed(2) + ' L',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[800],
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                      progressColor: (percentage > 0.80)
                          ? Colors.red
                          : (percentage > avgWaterUsage / tankLimit)
                              ? Colors.yellow
                              : const Color.fromRGBO(108, 229, 232, 1.0),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    )
                  ],
                ),
              )))),
      const Rewards()
    ]);
  }
}
