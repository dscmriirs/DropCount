import 'package:flutter/material.dart';
import '/utils/authentication.dart';
import '../authentication/google_sign_in_button.dart';

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
              margin: const EdgeInsets.only(
                  left: 30.0, top: 10.0, right: 30.0, bottom: 40.0),
              child: const Center(
                  child: Text("Welcome to DropCount",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue, fontSize: 35))),
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const GoogleSignInButton();
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF57C00)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
