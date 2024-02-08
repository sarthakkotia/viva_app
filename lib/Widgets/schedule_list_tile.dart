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
  "Pronite": "assets/Logos/concert.png",
  "Social": "assets/Logos/social-care.png",
  "Photography": "assets/Logos/camera.png",
  "Speaking Arts": "assets/Logos/conference.png",
  "Art": "assets/Logos/palette.png",
  "Quiz": "assets/Logos/quiz.png",
  "Drama": "assets/Logos/theatre.png",
  "Dance": "assets/Logos/dance.png",
  "Music": "assets/Logos/musical-notes.png",
  "Exciting": "assets/Logos/smiley.png",
  "Nukkad": "assets/Logos/concert.png",
  "Fashion": "assets/Logos/fashion.png",
};

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      trailing: const Icon(
        Icons.expand_circle_down,
        color: Color.fromRGBO(60, 40, 13, 1),
      ),contentPadding: EdgeInsets.symmetric(horizontal: 5),
      animateTrailing: true,
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(icons[widget.genre]!),
        ),
      ),
      initialElevation: 2.0,
      elevation: 5,
      shadowColor: Colors.transparent,
      baseColor: const Color.fromRGBO(246, 226, 212, 1),
      expandedColor: const Color.fromRGBO(246, 226, 212, 1),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.venue,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      borderRadius: BorderRadius.circular(12.0),
      title: Padding(
        padding: const EdgeInsets.only(top: 2.5, bottom: 8),
        child: FittedBox(
          fit: BoxFit.scaleDown,
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
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          child: Text(
            widget.desc,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromRGBO(60, 40, 13, 1),
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
