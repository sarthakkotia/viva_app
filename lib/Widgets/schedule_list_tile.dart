import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:viva_app/Screens/event_detail_screen.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.venue,
      required this.time,
      required this.desc,
      required this.imgUrl,
      required this.genre,
      required this.day,
      required this.poster})
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

Map<String, String> icons = {
  "Pronite": "assets/Logos/concert.png", // pronite
  "Social": "assets/Logos/social-care.png", // social
  "Photography": "assets/Logos/camera.png", // photography
  "Speaking Arts": "assets/Logos/conference.png", // speaking arts
  "": "assets/Logos/healthy-lifestyle.png", //
  "Art": "assets/Logos/palette.png", // Art
  "Quiz": "assets/Logos/quiz.png", // Quizzing
  "Drama": "assets/Logos/theatre.png", // Drama
  "Dance": "assets/Logos/dance.png",
  "b": "assets/Logos/concert.png",
  "c": "assets/Logos/healthy-lifestyle.png",
};

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      initialElevation: 2.0,
      elevation: 5,
      shadowColor: Colors.transparent,
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      baseColor: Color.fromRGBO(255, 145, 110, 1),
      expandedColor: Color.fromRGBO(246, 226, 212, 1),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.venue,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          Text(
            widget.time,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          )
        ],
      ),

      // leading: Image.asset(icons[widget.genre].toString()),
      // Set shadow color here
      borderRadius: BorderRadius.circular(12.0),
      // margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Padding(
        padding: const EdgeInsets.only(top: 2.5, bottom: 8),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          child: Text(
            widget.desc,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EventDetailScreen(
                    genre: widget.genre,
                    title: widget.title,
                    time: widget.time,
                    desc: widget.desc,
                    venue: widget.venue,
                    day: widget.day,
                    imgUrl: widget.imgUrl,
                    poster: widget.poster);
              }));
            },
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.lightBlueAccent, // Set button color here
            // ),
            child: const Text(
              "Detailed Description",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    ).animate().scaleXY();
  }
}
