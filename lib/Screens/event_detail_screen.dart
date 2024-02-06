import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatefulWidget {
  final String genre;
  final String title;
  final String date;
  final String time;
  final String desc;

  const EventDetailScreen(
      {Key? key,
      required this.genre,
      required this.title,
      required this.date,
      required this.time,
      required this.desc})
      : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CachedNetworkImage(imageUrl: ""),
          Row(children: [Icon(Icons.add), Text("Genre")]),
          Row(children: [Icon(Icons.location_pin), Text("")]),
          Row(
            children: [Icon(Icons.calendar_today_sharp), Text("data")],
          ),
          Text("Event Desc"),
          Text("Similar Events"),
          // ListView.builder(
          //   itemBuilder: (context, index) {
          // fetch from hive based on the current genre
          //     return Card();
          //   },
          //   scrollDirection: Axis.horizontal,
          // )
        ],
      ),
    );
  }
}
