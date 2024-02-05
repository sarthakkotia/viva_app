import 'package:flutter/material.dart';
import 'package:flutter_collapsing_toolbar/flutter_collapsing_toolbar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Models/ScheduleListModel.dart';
import 'package:viva_app/Provider/schedule_provider.dart';
import 'package:viva_app/Widgets/schedule_list_widget.dart';

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

//TODO: Add external storage to this so that it always does not connect to internet everytime it builds

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  final controller = ScrollController();
  double headerOffset = 0.0;
  int selectedIndex = 0;
  List<ScheduleModel> schedule = [];
  late ScheduleDataProvider schedule_data;
  bool loaded = false;

  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    if (widget.offline == false) {
      schedule_data = Provider.of<ScheduleDataProvider>(context, listen: false);
      setState(() {
        schedule = schedule_data.Dayindexdetails(0);
        loaded = true;
      });
    }

    super.initState();
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
                  selectedIndex = 0;
                  setState(() {});
                },
                child: Image.asset("assets/Logos/9feb.png")),
            TextButton(
                onPressed: () {
                  selectedIndex = 1;
                  setState(() {});
                },
                child: Image.asset("assets/Logos/10feb.png")),
            TextButton(
                onPressed: () {
                  selectedIndex = 2;
                  setState(() {});
                },
                child: Image.asset("assets/Logos/11feb.png")),
          ],
        ),
      ),
      body: Column(
        children: [
          TabBarView(
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
          widget.offline == true
              ? Lottie.asset("assets/AnimatedIcons/NoConnection.json")
              : loaded == false
                  ? CircularProgressIndicator()
                  : ScheduleList(schedule)
        ],
      ),
    );
  }
}
