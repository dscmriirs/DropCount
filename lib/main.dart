import 'dart:async';

import 'package:flutter/material.dart';
import '../screens/EntryPage.dart';
import '../screens/AboutPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      title: 'Drop Count',
      home: const MyHomePage(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
              child: Image.asset('../assets/images/loginImage.png',
                  width: 400, height: 250),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
              child: Center(
                  child: Text("Welcome to DropCount",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue, fontSize: 35))),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 30.0, top: 120.0, right: 30.0, bottom: 20.0),
              child: Image.asset('../assets/images/googleLogo.png',
                  width: 200, height: 150),
            )
          ],
        ),
      ),
    );
    return Material(type: MaterialType.transparency, child: AboutPage());
  }
}
