// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/AppBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './Settings.dart';
import './AboutPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void initState() {
    super.initState();
    readData();
  }
  final User? _username = FirebaseAuth.instance.currentUser;
  bool isLoading = true;
  List<String> list = [];
  Future<Map> readData() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "https://drop-count-default-rtdb.firebaseio.com/" + "test" + ".json";
    // Do not remove “data.json”,keep it as it is
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return {};
      }
      print(extractedData);
      return extractedData;
      setState(() {
        isLoading = false;
      });
  }

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
                  children: <Widget>[
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
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
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
                                      _username!.displayName.toString() +
                                      ' houses',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 5.0,
                            percent: 30 / 100,
                            center: Text(
                              30.toString() + "%",
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
                        // margin: ,
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
                              
               ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            list[index],
                            style: TextStyle(color: Colors.green),
                          ),
                        ));
                  }),
                  Text(readData().toString())
                  ],
                ),
              )))),
      Settings()
    ]);

//   void readData(){
//   databaseReference.once().then((DataSnapshot snapshot) {
//     print('Data : ${snapshot.value}');
//   });
// }
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
