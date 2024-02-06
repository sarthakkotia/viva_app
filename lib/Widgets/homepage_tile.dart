import 'package:flutter/material.dart';
import 'package:viva_app/Screens/event_detail_screen.dart';
import 'package:viva_app/Screens/test2_screen.dart';

class HomePageCard extends StatefulWidget {
  final String imgUrl;
  final String title;

  const HomePageCard({Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(child: Image.network(widget.imgUrl)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // fetch data from hive

          return EventDetailScreen(
            genre: '',
            title: '',
            date: '',
            time: '',
            desc: '',
          );
        }));
      },
    );
  }
}
