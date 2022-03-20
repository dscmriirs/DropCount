import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/EntryPage.dart';
import 'screens/AboutPage.dart';
import 'screens/NotConnectedPage.dart';
import 'screens/Settings.dart';
import 'screens/start.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: 'AIzaSyDuA9HjVgpAM7-os84C0--u4tNlq7yjGko', appId: '1:953974172838:android:a0f33736f2d459efcbd867', messagingSenderId: '953974172838', projectId: 'drop-count'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ChangeNotifierProvider(
      create: (context)=> GoogleSignInProvider(),
      child: const MaterialApp(
      title: 'Drop Count',
      home: MyHomePage(),
    ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
        type: MaterialType.transparency, child: SplashScreen());
  }
}
