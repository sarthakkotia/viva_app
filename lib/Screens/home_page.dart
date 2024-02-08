import "dart:core";
import "dart:ui";

import 'package:circle_nav_bar/circle_nav_bar.dart';
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:viva_app/Screens/home_screen.dart";
import "package:viva_app/Screens/info_screen.dart";
import "package:viva_app/Screens/schedule_screen.dart";

import "../Models/EventModelwithHive.dart";
import "../Provider/Data_provider.dart";

class HomePage extends StatefulWidget {
  List<List<EventModel>> days;
  final DataProvider data_provider;

  HomePage(this.days, this.data_provider, {super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

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
int currentPageIndex = 0;
List<Icon> activeIcons = const [
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
];
List<Icon> inactiveIcons = const [
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
];

List<Widget> screens = [
  (HomeScreen(true)),
  (ScheduleScreen([])),
  (const InfoScreen())
];

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    screens = [
      (HomeScreen(widget.data_provider.network)),
      (ScheduleScreen(widget.days)),
      (const InfoScreen())
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            activeIcons: activeIcons,
            inactiveIcons: inactiveIcons,
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
      ).animate().blurXY(
          begin: 1,
          end: 0,
          duration: const Duration(seconds: 6),
          curve: Curves.linear),
      body: screens[currentPageIndex],
    );
  }
}
