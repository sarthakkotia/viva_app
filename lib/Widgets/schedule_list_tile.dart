import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:viva_app/Screens/event_detail_screen.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.venue,
      required this.time,
      required this.desc, required this.imgUrl, required this.genre, required this.day, required this.poster})
      : super(key: key);

  final String imgUrl;
  final String genre;
  final String title;
  final String time;
  final int day;
  final String desc;
  final String venue;
  final String poster;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      elevation: 10.0,
      initialElevation: 10.0,
      shadowColor: Colors.lightBlueAccent, // Set shadow color here
      borderRadius: BorderRadius.circular(12.0),
      // margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.venue,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            widget.desc,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return EventDetailScreen(genre: widget.genre, title: widget.title, time: widget.time, desc: widget.desc, venue: widget.venue, day: widget.day, imgUrl: widget.imgUrl, poster: widget.poster);
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent, // Set button color here
            ),
            child: Text(
              "Detailed Description",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
