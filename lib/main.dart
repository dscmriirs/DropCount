import 'package:flutter/material.dart';
import '../screens/EntryPage.dart';
import '../screens/AboutPage.dart';
import '../screens/NotConnectedPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Drop Count',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
        type: MaterialType.transparency, child: NotConnected());
  }
}
