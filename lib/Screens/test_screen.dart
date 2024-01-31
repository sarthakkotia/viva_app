import "dart:core";

import "package:flutter/material.dart";
import "package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart";
import "package:lottie/lottie.dart";
import "package:viva_app/Screens/home_screen.dart";
import "package:viva_app/Screens/info_screen.dart";
import "package:viva_app/Screens/schedule_screen.dart";

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _controller2;
  int currentPageIndex = 0;
  bool homecolor = true;

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

  // final BorderRadius _borderRadius = const BorderRadius.only(
  //   topLeft: Radius.circular(25),
  //   topRight: Radius.circular(25),
  // );

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
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller2 = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    if (currentPageIndex == 0) {
      homecolor = true;
      _controller.repeat();
    }

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
            homecolor = false;
            currentPageIndex = value;
            controller
                .animateToPage(currentPageIndex,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.ease)
                .then((value) {
              if (currentPageIndex == 0) {
                homecolor = true;
                _controller.repeat();
              } else {
                _controller.reset;
              }
            });
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                height: heightscreen / 17,
                child: homecolor == true
                    ? Lottie.asset(
                        "assets/AnimatedIcons/icons8-home.json",
                        fit: BoxFit.cover,
                        controller: _controller,
                      )
                    : Image.asset(
                        "assets/Logos/icons8-home-64.png",
                        fit: BoxFit.cover,
                      ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: heightscreen / 17,
                child: currentPageIndex == 1
                    ? Lottie.asset(
                        "assets/AnimatedIcons/list.json",
                        fit: BoxFit.cover,
                        controller: _controller2,
                      )
                    : Image.asset(
                        "assets/Logos/icons8-info-64.png",
                        fit: BoxFit.cover,
                      ),
              ),
              label: "Info"),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: heightscreen / 17,
                child: currentPageIndex == 2
                    ? Lottie.asset(
                        "assets/AnimatedIcons/icons8-info.json",
                        fit: BoxFit.cover,
                        controller: _controller,
                      )
                    : Image.asset(
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
