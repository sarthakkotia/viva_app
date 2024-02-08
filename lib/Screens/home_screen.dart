import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:stacked_listview/stacked_listview.dart';

import '../Provider/Data_provider.dart';
import '../Widgets/homepage_tile.dart';

class HomeScreen extends StatefulWidget {
  bool network;

  HomeScreen(this.network, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  List<String> names = [
    "Pronites",
    "Dance",
    "Music",
    "Drama",
    "Exciting",
    "Photography",
    "Speaking Arts",
    "Nukkad",
    "Fashion",
    "Art",
    "Quizzing",
    "Social"
  ];

  List<String> icons = [
    "assets/Logos/concert.png",
    "assets/Logos/dance.png",
    "assets/Logos/musical-notes.png",
    "assets/Logos/theatre.png",
    "assets/Logos/smiley.png",
    "assets/Logos/camera.png",
    "assets/Logos/conference.png",
    "assets/Logos/concert.png",
    "assets/Logos/fashion.png",
    "assets/Logos/palette.png",
    "assets/Logos/quiz.png",
    "assets/Logos/social-care.png"
  ];
  int _value = 0;

  bool connection = true;

  @override
  Widget build(BuildContext context) {
    var data_provider = Provider.of<DataProvider>(context, listen: false);
    var fetchedLists = data_provider.fetcheddata;
    if (widget.network == false && ([...fetchedLists.values][1].isEmpty)) {
      setState(() {
        connection = false;
      });
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Logos/img2.png"), fit: BoxFit.cover)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
            padding: const EdgeInsets.only(
                top: 1.5, right: 1.5, left: 1.5, bottom: 25),
            child: Image.asset("assets/Logos/unit sticker 1.png")
                .animate()
                .flipV(duration: const Duration(milliseconds: 1000))
                .shimmer()),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int chipidx) {
              return ChoiceChip(
                elevation: 9,
                label: Text(names[chipidx]),
                selected: chipidx == _value,
                avatar: Image.asset(icons[chipidx]),
                backgroundColor: Colors.black,
                selectedColor: Colors.black12,
                showCheckmark: false,
                pressElevation: 5,
                onSelected: (value) {
                  if (value == true) {
                    setState(() {
                      _value = chipidx;
                      currentindex = _value;
                    });
                  }
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
          child: connection == false
              ? Image.asset("assets/AnimatedIcons/noconnection.gif")
              : StackedListView(
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
                      poster:
                          (fetchedLists[currentindex]![index].Poster != 'null')
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
