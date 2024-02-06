import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Models/EventModelwithHive.dart';
import 'package:viva_app/Provider/Data_provider.dart';

import '../Models/EventsList.dart';
import '../Widgets/schedule_list_tile.dart';

List<String> daysassets = [
  "assets/Logos/9feb.png",
  "assets/Logos/10feb.png",
  "assets/Logos/11feb.png",
];

class ScheduleScreen extends StatefulWidget {
  // bool offline;

  List<List<EventModel>> days;

  ScheduleScreen(this.days, {super.key});

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
  late List<List<EventModel>> days;

  @override
  void initState() {
    super.initState();
    // Hive.openBox<EventsList>("Events").then((value) {
    //   dataProvider = Provider.of<DataProvider>(context, listen: false);
    //   days = dataProvider.days;
    //   setState(() {
    //     schedule = days[0];
    //   });
    // });

    /*
    if (widget.offline == false) {
      setState(() {
        schedule = schedule_data.Dayindexdetails(0);
        loaded = true;
      });
    }
     */
  }

  @override
  Widget build(BuildContext context) {
    dataProvider = Provider.of<DataProvider>(context, listen: false);
    days = dataProvider.days;
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                        schedule = days[0];
                      });
                    },
                    child: Image.asset("assets/Logos/9feb.png")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                        schedule = days[1];
                      });
                    },
                    child: Image.asset("assets/Logos/10feb.png")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                        schedule = days[2];
                      });
                    },
                    child: Image.asset("assets/Logos/11feb.png")),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomListTile(
                        title: days[0][index].Title +
                            (" (${days[0][index].Genre})"),
                        venue: days[0][index].Venue,
                        time: days[0][index].DateandTime.toString(),
                        eventDescription: days[0][index].Desc);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: days[0].length),
              ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomListTile(
                        title: days[1][index].Title +
                            (" (${days[1][index].Genre})"),
                        venue: days[1][index].Venue,
                        time: days[1][index].DateandTime.toString(),
                        eventDescription: days[1][index].Desc);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: days[1].length),
              ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomListTile(
                        title: days[2][index].Title +
                            (" (${days[2][index].Genre})"),
                        venue: days[2][index].Venue,
                        time: days[2][index].DateandTime.toString(),
                        eventDescription: days[2][index].Desc);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: days[2].length)
            ],
          ),
        ));

    /*
          widget.offline == true
              ? Lottie.asset("assets/AnimatedIcons/NoConnection.json")
              : loaded == false
                  ? const CircularProgressIndicator()
                  : ScheduleList(schedule)
    */
  }
}
