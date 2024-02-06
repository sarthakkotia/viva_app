import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Models/EventModelwithHive.dart';
import 'package:viva_app/Provider/Data_provider.dart';

import '../Models/EventsList.dart';

List<String> daysassets = [
  "assets/Logos/9feb.png",
  "assets/Logos/10feb.png",
  "assets/Logos/11feb.png",
];

class ScheduleScreen extends StatefulWidget {
  bool offline;

  ScheduleScreen(this.offline, {super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  List<EventModel> schedule = [];
  bool loaded = false;
  final controller = ScrollController();
  double headerOffset = 0.0;
  late DataProvider dataProvider;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    Hive.openBox<EventsList>("Events").then((value) {
      dataProvider = Provider.of<DataProvider>(context, listen: false);
      dataProvider.fetchDaysList();
    });

    /*
    if (widget.offline == false) {
      setState(() {
        schedule = schedule_data.Dayindexdetails(0);
        loaded = true;
      });
    }
     */
  }

  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: [
            TextButton(
                onPressed: () {
                  selectedIndex = 1;
                  // setState(() {
                  //   schedule = dataProvider.day9;
                  // });
                },
                child: Image.asset("assets/Logos/9feb.png")),
            TextButton(
                onPressed: () {
                  selectedIndex = 2;
                  // setState(() {
                  //   schedule = dataProvider.day10;
                  // });
                },
                child: Image.asset("assets/Logos/10feb.png")),
            TextButton(
                onPressed: () {
                  selectedIndex = 3;
                  // setState(() {
                  //   schedule = dataProvider.day11;
                  // });
                },
                child: Image.asset("assets/Logos/11feb.png")),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
    /*
          widget.offline == true
              ? Lottie.asset("assets/AnimatedIcons/NoConnection.json")
              : loaded == false
                  ? const CircularProgressIndicator()
                  : ScheduleList(schedule)
    */
  }
}
