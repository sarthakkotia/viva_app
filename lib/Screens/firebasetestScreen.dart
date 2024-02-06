import "dart:core";

import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirebaseScreen>
    with TickerProviderStateMixin {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    fcm.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    fcm.subscribeToTopic("users");
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        primary: true,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // final logic2ttt = logic2();
              // logic2ttt.run();
            },
            child: Text(""),
          ),
        ));
  }
}
