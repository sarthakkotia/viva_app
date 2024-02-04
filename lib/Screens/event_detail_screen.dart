import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          //     return Card();
          //   },
          //   scrollDirection: Axis.horizontal,
          // )
        ],
      ),
    );
  }
}
