import 'package:flutter/material.dart';
import 'package:stacked_listview/stacked_listview.dart';
import 'package:viva_app/Widgets/homepage_chip.dart';
import 'package:viva_app/Widgets/homepage_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> names = [
  "Pronites",
  "Dance",
  "Music",
  "Natak",
  "Photography",
  "Quizzinga",
  "Social Causes",
  "Lifestyle",
  "Art",
  "Media Cell",
  "Speaking Skills"
];
List<String> icons = [
  "assets/Logos/concert.png",
  "assets/Logos/concert.png",
  "assets/Logos/concert.png",
  "assets/Logos/concert.png",
  "assets/Logos/healthy-lifestyle.png",
  "assets/Logos/palette.png"
      "assets/Logos/concert.png",
  "assets/Logos/concert.png",
  "assets/Logos/concert.png",
  "assets/Logos/concert.png",
  "assets/Logos/healthy-lifestyle.png",
];

class _HomeScreenState extends State<HomeScreen> {
  int currentindex =
      0; // to decide which chip selected and subsequently the stackview

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return HomePageChip(
                title: names[index],
                icon: icons[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 10,
              );
            },
            itemCount: names.length,
          ),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: StackedListView(
              itemCount: 50,
              builder: (BuildContext context, int index) {
                return HomePageCard();
              },
              itemExtent: MediaQuery.sizeOf(context).height * 0.3),
        )
      ]),
    );
  }
}
