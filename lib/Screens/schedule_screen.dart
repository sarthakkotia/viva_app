import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Models/EventModelwithHive.dart';
import 'package:viva_app/Provider/Data_provider.dart';

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

String formatDateTime(DateTime dateTime) {
  // Use intl package for formatting
  String formattedDate =
      DateFormat('MMMM d').format(dateTime); // Full month name and day
  String formattedTime = DateFormat.jm().format(dateTime); // Time with AM/PM

  return '$formattedDate, $formattedTime';
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
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        TabBar(
          tabs: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
              child: Tab(
                height: 65,
                icon: Image.asset(
                  "assets/Logos/9feb.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
              child: Tab(
                height: 65,
                icon: Image.asset("assets/Logos/10feb.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
              child: Tab(
                height: 65,
                icon: Image.asset("assets/Logos/11feb.png"),
              ),
            )
          ],
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              AnimationLimiter(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // Sort the events by time before displaying
                    days[0]
                        .sort((a, b) => a.DateandTime.compareTo(b.DateandTime));

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: CustomListTile(
                          title: days[0][index].Title +
                              (" (${days[0][index].Genre})"),
                          venue: days[0][index].Venue,
                          time: formatDateTime(days[0][index].DateandTime),
                          desc: days[0][index].Desc,
                          day: days[0][index].Day,
                          imgUrl: days[0][index].Img,
                          genre: days[0][index].Genre,
                          poster: days[0][index].Poster != 'null'
                              ? days[0][index].Poster
                              : days[0][index].Img,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: days[0].length,
                ),
              ),
              AnimationLimiter(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // Sort the events by time before displaying
                    days[1]
                        .sort((a, b) => a.DateandTime.compareTo(b.DateandTime));

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: CustomListTile(
                          title: days[1][index].Title +
                              (" (${days[1][index].Genre})"),
                          venue: days[1][index].Venue,
                          time: formatDateTime(days[1][index].DateandTime),
                          desc: days[1][index].Desc,
                          day: days[1][index].Day,
                          imgUrl: days[1][index].Img,
                          genre: days[1][index].Genre,
                          poster: days[1][index].Poster != 'null'
                              ? days[1][index].Poster
                              : days[1][index].Img,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: days[1].length,
                ),
              ),
              AnimationLimiter(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // Sort the events by time before displaying
                    days[2]
                        .sort((a, b) => a.DateandTime.compareTo(b.DateandTime));

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: CustomListTile(
                          title: days[2][index].Title +
                              (" (${days[2][index].Genre})"),
                          venue: days[2][index].Venue,
                          time: formatDateTime(days[2][index].DateandTime),
                          desc: days[2][index].Desc,
                          day: days[2][index].Day,
                          imgUrl: days[2][index].Img,
                          genre: days[2][index].Genre,
                          poster: days[2][index].Poster != 'null'
                              ? days[2][index].Poster
                              : days[2][index].Img,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: days[2].length,
                ),
              )
            ],
          ),
        ),
      ],
    );
    /*
    return Scaffold(
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
    );


     */
    /*
          widget.offline == true
              ? Lottie.asset("assets/AnimatedIcons/NoConnection.json")
              : loaded == false
                  ? const CircularProgressIndicator()
                  : ScheduleList(schedule)
    */
  }
}
