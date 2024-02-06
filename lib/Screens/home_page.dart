import "dart:core";

import 'package:connectivity_plus/connectivity_plus.dart';
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart";
import "package:provider/provider.dart";
import "package:viva_app/Screens/home_screen.dart";
import "package:viva_app/Screens/info_screen.dart";
import "package:viva_app/Screens/schedule_screen.dart";
import "package:viva_app/Widgets/animate_gradient.dart";

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
    const AnimateGradientClass(HomeScreen()),
    (ScheduleScreen([])),
    (InfoScreen())
  ];

  final PageController controller =
      PageController(initialPage: 0, keepPage: true);
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
    bool offline = true;
    (Connectivity().checkConnectivity()).then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        offline = false;
      }
      screens = [
        const AnimateGradientClass(HomeScreen()),
        (ScheduleScreen(days)),
        (InfoScreen())
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      primary: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        height: heightscreen / 12,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.circle,
        elevation: 5,
        snakeViewColor: const Color.fromRGBO(74, 68, 88, 1),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromRGBO(42, 39, 47, 1),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: currentPageIndex,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
            controller.animateToPage(currentPageIndex,
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                height: heightscreen / 17,
                child: Image.asset(
                  "assets/Logos/icons8-home-64.png",
                  fit: BoxFit.cover,
                ),
              ),
              label: "Home"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_sharp),
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: heightscreen / 17,
                child: Image.asset(
                  "assets/Logos/icons8-info-64.png",
                  fit: BoxFit.cover,
                ),
              ),
              label: "Info"),
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        children: screens,
      ),
    );
  }
}
