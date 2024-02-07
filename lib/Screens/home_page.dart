import "dart:core";
import "dart:ui";

import "package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart";
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:viva_app/Screens/home_screen.dart";
import "package:viva_app/Screens/info_screen.dart";
import "package:viva_app/Screens/schedule_screen.dart";

import "../Provider/Data_provider.dart";
import "../Provider/Services/Notifier.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentPageIndex = 0;
  List<Widget> screens = [
    (const HomeScreen()),
    (ScheduleScreen([])),
    (const InfoScreen())
  ];
  List<NavigationDestination> listNavigationDestination = [
    const NavigationDestination(
        enabled: true,
        icon: Icon(
          Icons.home_sharp,
          size: 35,
        ),
        label: "Home"),
    const NavigationDestination(
        icon: Icon(
          Icons.checklist_rtl_sharp,
          size: 35,
        ),
        label: "Schedule"),
    const NavigationDestination(
        icon: Icon(
          Icons.person,
          size: 35,
        ),
        label: "Info"),
  ];

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
    fcm.setForegroundNotificationPresentationOptions(
        sound: true, badge: true, alert: true);
    NotificationClass nc = NotificationClass();
    nc.intitalize();
  }

  @override
  void initState() {
    setupPushNotifications();
    super.initState();
    var data_provider = Provider.of<DataProvider>(context, listen: false);
    var days = data_provider.days;
    /*
    bool offline = true;
    (Connectivity().checkConnectivity()).then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        offline = false;
      }
     */
    screens = [
      (const HomeScreen()),
      (ScheduleScreen(days)),
      (const InfoScreen())
    ];
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      primary: true,
      bottomNavigationBar: ClipRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: CircleNavBar(
            iconCurve: Curves.linear,
            iconDurationMillSec: 500,
            tabCurve: Curves.easeOutSine,
            tabDurationMillSec: 1500,
            activeIcons: const [
              Icon(
                Icons.home,
                color: Colors.white,
                size: 35,
              ),
              Icon(
                Icons.list_alt,
                color: Colors.white,
                size: 35,
              ),
              Icon(
                Icons.info,
                color: Colors.white,
                size: 35,
              ),
            ],
            inactiveIcons: const [
              Icon(
                Icons.home,
                size: 35,
              ),
              Icon(
                Icons.list_alt,
                size: 35,
              ),
              Icon(
                Icons.info,
                size: 35,
              )
            ],
            color: Colors.black,
            circleColor: const Color.fromRGBO(0, 0, 0, 0.5),
            padding: const EdgeInsets.only(top: 25),
            height: 60,
            circleWidth: 60,
            onTap: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            shadowColor: const Color.fromRGBO(255, 240, 161, 0.5),
            circleShadowColor: Colors.deepPurple,
            elevation: 2,
            activeIndex: currentPageIndex,
          ),
        ),
      ),
      body: screens[currentPageIndex],
    );
  }
}
