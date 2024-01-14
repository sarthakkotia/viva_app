import 'package:flutter/material.dart';
import 'package:flutter_collapsing_toolbar/flutter_collapsing_toolbar.dart';

List<IconButton> kSampleIcons = [
  IconButton(
      onPressed: () {},
      icon: SizedBox(
        height: 80,
        child: Image.asset("assets/Logos/calendar-date (1).png"),
      )),
  IconButton(
      onPressed: () {},
      icon: SizedBox(
        height: 80,
        child: Image.asset("assets/Logos/calendar-date.png"),
      )),
  IconButton(
      onPressed: () {},
      icon: SizedBox(
        height: 80,
        child: Image.asset("assets/Logos/calendar-days.png"),
      ))
];

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final controller = ScrollController();
  double headerOffset = 0.0;

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
                decorationForegroundColor: Color(0xFFFF5000),
                decorationBackgroundColor: Colors.white,
                onCollapsing: (double offset) {
                  setState(() {
                    headerOffset = offset;
                  });
                },
                featureCount: 3,
                featureIconBuilder: (context, index) {
                  return kSampleIcons[index];
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
                  kSampleIcons[index].onPressed!();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
