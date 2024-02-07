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

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage2> with TickerProviderStateMixin {
  int currentPageIndex = 0;
  List<Widget> screens = [(HomeScreen()), (ScheduleScreen([])), (InfoScreen())];
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
      screens = [(HomeScreen()), (ScheduleScreen(days)), (InfoScreen())];
    });
  }

  final _controller = NotchBottomBarController(index: 0);

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      primary: true,
      /*
      bottomNavigationBar: AnimatedNotchBottomBar(
        bottomBarWidth: 5,
        color: Colors.purple,
        notchBottomBarController: _controller,
        bottomBarItems: [
          BottomBarItem(
              inActiveItem: Icon(Icons.home),
              activeItem: Icon(Icons.home),
              itemLabel: "Home"),
          BottomBarItem(
              inActiveItem: Icon(Icons.format_list_bulleted_sharp),
              activeItem: Icon(Icons.format_list_bulleted_sharp),
              itemLabel: "Schedule"),
          BottomBarItem(
              inActiveItem: Icon(Icons.info),
              activeItem: Icon(Icons.info),
              itemLabel: "Info"),
        ],
        onTap: (int value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        kIconSize: 24,
        kBottomRadius: 28,
      ),
       */
      bottomNavigationBar: ClipRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 10.0),
          child: CircleNavBar(
            iconCurve: Curves.linear,
            iconDurationMillSec: 500,
            tabCurve: Curves.easeOutSine,
            tabDurationMillSec: 1500,
            activeIcons: const [
              Icon(Icons.home, color: Colors.white),
              Icon(Icons.list_alt, color: Colors.white),
              Icon(Icons.info, color: Colors.white),
            ],
            inactiveIcons: const [
              Icon(Icons.home),
              Icon(Icons.list_alt),
              Icon(Icons.info)
            ],
            color: const Color.fromRGBO(0, 0, 0, 1),
            circleColor: const Color.fromRGBO(0, 0, 0, 0.25),
            padding: const EdgeInsets.only(top: 25),
            height: 60,
            circleWidth: 60,
            onTap: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            circleGradient: LinearGradient(colors: [
              Color.fromRGBO(222, 111, 0, 1),
              Color.fromRGBO(255, 163, 0, 1)
            ]),
            shadowColor: Colors.black,
            elevation: 10,
            activeIndex: currentPageIndex,
          ),
          /*
          child: GNav(
              style: GnavStyle.google,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              iconSize: 30,
              gap: 15,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              rippleColor: Colors.grey.shade800,
              onTabChange: (value) {
                setState(() {
                  currentPageIndex = value;
                });
              },
              tabs: const [
                GButton(
                  semanticLabel: "Home",
                  icon: Icons.home_filled,
                  text: "Home",
                ),
                GButton(
                  semanticLabel: "Schedule",
                  icon: Icons.format_list_bulleted,
                  text: "Schedule",
                ),
                GButton(
                  semanticLabel: "Info",
                  icon: Icons.info_outline,
                  text: "Info",
                )
              ]),
        
           */
          /*
          child: CurvedNavigationBar(
            index: currentPageIndex,
            color: const Color.fromRGBO(0, 0, 0, 0.5),
            height: heightscreen / 15,
            backgroundColor: Colors.white12,
            onTap: (value) {
              setState(() {
                currentPageIndex = value;
              });
            },
            items: const [
              Icon(Icons.home),
              Icon(Icons.format_list_bulleted_sharp),
              Icon(Icons.info)
              // BottomNavigationBarItem(
              //     icon: SizedBox(
              //       height: heightscreen / 17,
              //       child: Image.asset(
              //         "assets/Logos/icons8-home-64.png",
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     label: "Home"),
              // BottomNavigationBarItem(
              //     icon: SizedBox(
              //       height: heightscreen / 17,
              //       child: Image.asset(
              //         "assets/Logos/icons8-info-64.png",
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     label: "Info"),
            ],
          ),
        
           */
        ),
      ),
      body: screens[currentPageIndex],
    );
  }
}
/*
      SnakeNavigationBar.color(
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
    );
  }
} */
