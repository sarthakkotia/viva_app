import "dart:core";

import "package:flutter/material.dart";
import "package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart";
import "package:provider/provider.dart";
import "package:viva_app/Screens/home_screen.dart";
import "package:viva_app/Screens/info_screen.dart";
import "package:viva_app/Screens/schedule_screen.dart";
import "../Provider/schedule_provider.dart";

class Test2Screen extends StatefulWidget {
  const Test2Screen({super.key});

  @override
  State<Test2Screen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Test2Screen>
    with TickerProviderStateMixin {
  int currentPageIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    ScheduleScreen(),
    const InfoScreen()
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

  EdgeInsets padding = const EdgeInsets.all(12);

  Color selectedColor = Colors.black;
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFECD7FD),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  @override
  void initState() {
    Provider.of<ScheduleDataProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      extendBody: false,
      primary: true,
      // backgroundColor: Colors.amber,
      bottomNavigationBar: SnakeNavigationBar.color(
        height: heightscreen / 11,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.circle,
        elevation: 5,
        snakeViewColor: const Color.fromRGBO(74, 68, 88, 1),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromRGBO(42, 39, 47, 1),

        ///configuration for SnakeNavigationBar.gradient
        //  snakeViewGradient: selectedGradient,
        //  selectedItemGradient:
        //      snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //  unselectedItemGradient: unselectedGradient,

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
          BottomNavigationBarItem(
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
