import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/app_bar.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  final User? _username = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      SafeArea(
          child: Scaffold(
              appBar: const AppNavbar(),
              body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(children: [
                        Image.asset('assets/images/userIcon.png'),
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(_username!.displayName.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                Text(_username!.email.toString().split('@')[0],
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ],
                            )),
                      ])
                    ],
                  ))))
    ]);
  }
}
