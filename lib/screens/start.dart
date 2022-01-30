import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()));
    });
  }

  @override
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
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
              child: Image.asset('../assets/images/loginImage.png',
                  width: 400, height: 250),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
              child: const Center(
                  child: Text("Welcome to DropCount",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue, fontSize: 35))),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30.0, top: 120.0, right: 30.0, bottom: 20.0),
              child: Image.asset('../assets/images/googleLogo.png',
                  width: 200, height: 150),
            )
          ],
        ),
      ),
    );
  }
}
