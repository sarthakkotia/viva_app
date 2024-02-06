import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatefulWidget {
  final String imgUrl;
  final String genre;
  final String title;
  final DateTime time;
  final int day;
  final String desc;
  final String venue;

  const EventDetailScreen({
    Key? key,
    required this.genre,
    required this.title,
    required this.time,
    required this.desc,
    required this.venue,
    required this.day,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CachedNetworkImage(imageUrl: widget.imgUrl),
          Row(children: [Icon(Icons.add), Text("Genre")]),
          Row(children: [Icon(Icons.location_pin), Text(widget.genre)]),
          Row(
            children: [
              Icon(Icons.calendar_today_sharp),
              Text(widget.day.toString())
            ],
          ),
          Text(widget.desc),
          Text("Similar Events"),
          // ListView.builder(
          //   itemBuilder: (context, index) {
          //     return Card(child: ,);
          //   },
          //   itemCount:  2,
          //   scrollDirection: Axis.horizontal,
          //
          // )
        ],
      ),
    );
  }
}
