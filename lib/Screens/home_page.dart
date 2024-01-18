import "dart:core";

import "package:flutter/material.dart";
import "package:viva_app/Screens/home_screen.dart";
import "package:viva_app/Screens/info_screen.dart";
import "package:viva_app/Screens/schedule_screen.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //TODO: https://karthikponnam.medium.com/flutter-pageview-withbottomnavigationbar-fb4c87580f6a

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    ScheduleScreen(),
    const InfoScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: currentPageIndex == 2
          ? AppBar(
              scrolledUnderElevation: 0,
              centerTitle: true,
              title: const Text("Contact Us", style: TextStyle(fontSize: 30)),
            )
          : null,
      primary: true,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
              enabled: true,
              icon: Icon(
                Icons.home_sharp,
                size: 35,
              ),
              label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.checklist_rtl_sharp, size: 35),
              label: "Schedule"),
          NavigationDestination(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: "Info"),
        ],
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: screens,
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
      ),
      // body: screens[currentPageIndex],
    );
  }
}
