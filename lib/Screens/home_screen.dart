import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:stacked_listview/stacked_listview.dart';
import 'package:viva_app/Widgets/homepage_chip.dart';
import 'package:viva_app/Widgets/homepage_tile.dart';

import '../Provider/Data_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  List<String> names = [
    "Pronites",
    "Dance",
    "Music",
    "Natak",
    "Photography",
    "Quizzinga",
    "Social",
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
    var fetchedLists = data_provider.fetcheddata;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Logos/img2.png"), fit: BoxFit.cover)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
            padding: const EdgeInsets.all(25),
            child: Image.asset("assets/Logos/vivlogo.png")
                .animate()
                .flipV(duration: const Duration(milliseconds: 1250))),
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.6,
          child: StackedListView(
            itemCount: fetchedLists[currentindex]!.length,
            builder: (BuildContext context, int index) {
              // fetch data from hive
              return HomePageCard(
                title: fetchedLists[currentindex]![index].Title,
                imgUrl: fetchedLists[currentindex]![index].Img,
                genre: fetchedLists[currentindex]![index].Genre,
                desc: fetchedLists[currentindex]![index].Desc,
                date: fetchedLists[currentindex]![index].DateandTime,
                venue: fetchedLists[currentindex]![index].Venue,
                day: fetchedLists[currentindex]![index].Day,
                poster: (fetchedLists[currentindex]![index].Poster != 'null')
                    ? fetchedLists[currentindex]![index].Poster
                    : fetchedLists[currentindex]![index].Img,
              );
            },
            itemExtent: MediaQuery.of(context).size.height * 0.25,
          ),
        )
      ]),
    );
  }
}
