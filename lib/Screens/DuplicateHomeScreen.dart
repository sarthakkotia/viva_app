import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_listview/stacked_listview.dart';
import 'package:viva_app/Widgets/homepage_chip.dart';
import 'package:viva_app/Widgets/homepage_tile.dart';

import '../Provider/Data_provider.dart';

class DuplicateHomeScreen extends StatefulWidget {
  const DuplicateHomeScreen({Key? key}) : super(key: key);

  @override
  State<DuplicateHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DuplicateHomeScreen> {
  int currentindex =
      0; // to decide which chip selected and subsequently the stackview

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
    "Speaking Arts"
  ];
  List<String> icons = [
    "assets/Logos/concert.png",
    "assets/Logos/concert.png",
    "assets/Logos/concert.png",
    "assets/Logos/concert.png",
    "assets/Logos/healthy-lifestyle.png",
    "assets/Logos/palette.png",
    "assets/Logos/concert.png",
    "assets/Logos/concert.png",
    "assets/Logos/concert.png",
    "assets/Logos/concert.png",
    "assets/Logos/healthy-lifestyle.png",
  ];

  @override
  Widget build(BuildContext context) {
    DataProvider data_provider =
        Provider.of<DataProvider>(context, listen: false);
    data_provider.fetchGenreList();
    print(data_provider.ExcitingList.length);
    print(data_provider.ArtList.length);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Padding(
        padding: const EdgeInsets.all(25),
        child: Image.asset("assets/Logos/vivlogo.png"),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return HomePageChip(
              title: names[index],
              icon: icons[index],
              onPressed: () {
                setState(() {
                  currentindex = index;
                });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: names.length,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.6,
        child: StackedListView(
          itemCount: 10,
          builder: (BuildContext context, int index) {
            // fetch data from hive
            return HomePageCard(
              title: 'dummy',
              imgUrl: 'dummy',
            );
          },
          itemExtent: MediaQuery.of(context).size.height * 0.25,
        ),
      )
    ]);
  }
}