import 'package:flutter/material.dart';
import 'package:flutter_collapsing_toolbar/flutter_collapsing_toolbar.dart';
import 'package:viva_app/Widgets/schedule_list_tile.dart';

List<String> daysassets = [
  "assets/Logos/9feb.png",
  "assets/Logos/10feb.png",
  "assets/Logos/11feb.png",
];

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final controller = ScrollController();
  double headerOffset = 0.0;
  int selectedIndex = 0;

  List<List<String>> lists = [
    ["List 1 Item 1", "List 1 Item 2"],
    ["List 2 Item 1", "List 2 Item 2"],
    ["List 3 Item 1", "List 3 Item 2"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  return Text(
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
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(left: 10, right: 10),
                itemCount: lists[selectedIndex].length,
                itemBuilder: (context, itemIndex) {
                  return CustomListTile(
                    title: lists[selectedIndex][itemIndex],
                    venue: 'LT-1',
                    time: '10:00 AM',
                    eventDescription:
                        'text used in laying out print text used in laying out print text used in laying out print text used in laying out printtext used in laying out print',
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 10,
                    thickness: 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
