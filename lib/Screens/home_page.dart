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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  List<Widget> screens = const [HomeScreen(), ScheduleScreen(), InfoScreen()];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: screens[currentPageIndex],
    );
  }
}
