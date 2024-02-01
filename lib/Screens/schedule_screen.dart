import 'package:connectivity_plus/connectivity_plus.dart';
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
  bool offline = true;

  @override
  void initState() {
    (Connectivity().checkConnectivity()).then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        setState(() {
          offline = false;
        });
        schedule_data =
            Provider.of<ScheduleDataProvider>(context, listen: false);
        setState(() {
          schedule = schedule_data.Dayindexdetails(0);
          loaded = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CollapsingToolbar(
              controller: controller,
              expandedHeight: 160,
              collapsedHeight: 64,
              decorationForegroundColor: Colors.greenAccent,
              decorationBackgroundColor: Colors.white,
              onCollapsing: (double offset) {
                setState(() {
                  headerOffset = offset;
                });
              },
              featureCount: 3,
              featureIconBuilder: (context, index) {
                return SizedBox(
                  height: index == selectedIndex
                      ? 80
                      : 55, // Adjust the values as needed
                  width: index == selectedIndex
                      ? 80
                      : 55, // Adjust the values as needed
                  child: Image.asset(
                    daysassets[index],
                  ),
                );
              },
              featureLabelBuilder: (context, index) {
                return const Text(
                  "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                );
              },
              featureOnPressed: (context, index) {
                setState(() {
                  selectedIndex = index;
                  loaded = false;
                  schedule = schedule_data.Dayindexdetails(index);
                  loaded = true;
                });
              },
            ),
          ),
          offline == true
              ? Lottie.asset("assets/AnimatedIcons/NoConnection.json")
              : loaded == false
                  ? const CircularProgressIndicator()
                  : ScheduleList(schedule)
        ],
      ),
    );
  }
}
