import "dart:core";

import "package:flutter/material.dart";

import "../Logic/logic.dart";

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirebaseScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        primary: true,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final logic = Logic();
              logic.fetchData();
              // final logic2ttt = logic2();
              // logic2ttt.run();
            },
            child: Text("go"),
          ),
        ));
  }
}
