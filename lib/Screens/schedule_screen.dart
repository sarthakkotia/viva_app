import 'package:flutter/material.dart';
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

class _ScheduleScreenState extends State<ScheduleScreen> {
  final controller = ScrollController();
  double headerOffset = 0.0;
  int selectedIndex = 0;
  List<ScheduleModel> schedule = [];
  late ScheduleDataProvider schedule_data;
  bool loaded = false;

  @override
  void initState() {
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
        actions: [],
      ),
      body: Column(
        children: [
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
