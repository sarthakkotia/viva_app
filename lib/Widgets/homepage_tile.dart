import 'package:flutter/material.dart';
import 'package:viva_app/Screens/event_detail_screen.dart';

class HomePageCard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String genre;
  final DateTime date;
  final String desc;
  final String venue;
  final int day;

  const HomePageCard(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.genre,
      required this.date,
      required this.desc,
      required this.venue,
      required this.day})
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
            genre: widget.genre,
            title: widget.title,
            day: widget.day,
            time: widget.date,
            desc: widget.desc,
            venue: widget.venue,
            imgUrl: widget.imgUrl,
          );
        }));
      },
    );
  }
}
