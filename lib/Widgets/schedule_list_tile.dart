// i think its not necessary to make this

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.venue,
      required this.time,
      required this.eventDescription})
      : super(key: key);

  final String title;
  final String venue;
  final String time;
  final String eventDescription;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      // lessen their width
      title: Column(
        children: [
          Text(widget.title, textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text(widget.venue), Text(widget.time)],
          )
        ],
      ),
      children: [
        Text(widget.eventDescription),
        ElevatedButton(
            onPressed: () {}, child: const Text("Detailed Description"))
      ],
    );
  }
}
