import "package:flutter/material.dart";
import "package:viva_app/Screens/home_page.dart";

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<TestScreen> createState() => _TestScreenStateState();
}

class _TestScreenStateState extends State<TestScreen> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (value) {
          if (value == 0) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ));
          }
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home_sharp), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.checklist_rtl_sharp), label: "Schedule"),
          NavigationDestination(icon: Icon(Icons.person), label: "Info"),
        ],
      ),
      body: const SafeArea(
        child: Center(child: Text("test")),
      ),
    );
  }
}
