import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Widgets/similar_event_tile.dart';

import '../Provider/Data_provider.dart';
import '../Provider/Services/urllauncher.dart';

Map<String, String> icons = {
  "Pronite": "assets/Logos/concert.png", // pronite
  "Social": "assets/Logos/social-care.png", // social
  "Photography": "assets/Logos/camera.png", // photography
  "Speaking Arts": "assets/Logos/conference.png", // speaking arts
  "Art": "assets/Logos/palette.png", // Art
  "Quiz": "assets/Logos/quiz.png", // Quizzing
  "Drama": "assets/Logos/theatre.png", // Drama
  "Dance": "assets/Logos/dance.png",
  "Music": "assets/Logos/musical-notes.png",
  "Exciting": "assets/Logos/smiley.png", "Nukkad": "assets/Logos/concert.png",
  "Fashion": "assets/Logos/fashion.png",
};

Map<String, String> rulebooks = {
  "Nukkad": 'https://d3lhw1p67h4h5r.cloudfront.net/AAVEG%20Rule%20Book.pdf',
  "Photography":
      'https://d3lhw1p67h4h5r.cloudfront.net/IMAGINATION%20RULEBOOK-1.pdf',
  "Music":
      'https://d3lhw1p67h4h5r.cloudfront.net/Capriccio%20(Music%20Events%20Detail).pdf',
  "Art": 'https://d3lhw1p67h4h5r.cloudfront.net/vignette%20Rulebook.pdf',
  "SpeakingArts":
      'https://d3lhw1p67h4h5r.cloudfront.net/Speaking-Arts-viva2k24.pdf',
  "Drama":
      'https://d3lhw1p67h4h5r.cloudfront.net/Rendition%20Rule%20Book_24.pdf',
  "Quiz": 'https://d3lhw1p67h4h5r.cloudfront.net/QUIZZINGA.pdf',
  "Dance":
      'https://d3lhw1p67h4h5r.cloudfront.net/Insignia Rulebook (updated).pdf',
  "Social": 'https://d3lhw1p67h4h5r.cloudfront.net/Sankalp-Sahyog.pdf',
  "Fashion": 'https://d3lhw1p67h4h5r.cloudfront.net/EMINENCE Rule Book.pdf',
};

class EventDetailScreen extends StatefulWidget {
  final String imgUrl;
  final String genre;
  final String title;
  final String time;
  final int day;
  final String desc;
  final String venue;
  final String poster;

  const EventDetailScreen({
    Key? key,
    required this.genre,
    required this.title,
    required this.time,
    required this.desc,
    required this.venue,
    required this.day,
    required this.imgUrl,
    required this.poster,
  }) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    DataProvider data_provider =
        Provider.of<DataProvider>(context, listen: false);
    var similarEvents = data_provider.fetchSimilarEvents(widget.genre);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: widget.poster,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height *
                  0.4, // Set the desired height for the poster image
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_pin,
                      color: Colors.deepPurple), // Set icon color here
                  SizedBox(width: 8.0),
                  Text(
                    widget.venue,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today_sharp,
                      color: Colors.deepPurple), // Set icon color here
                  const SizedBox(width: 8.0),
                  Text(
                    widget.time.toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            (widget.genre != "Exciting")
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        UrlLauncher launcher = UrlLauncher();
                        Uri url = Uri.parse(rulebooks[widget.genre]!);
                        launcher.launchweb(url);
                      },
                      child: Text("Rulebook",style: TextStyle(color: Colors.deepPurple),),
                    ))
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.desc,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Similar Events",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: similarEvents.length,
                itemBuilder: (context, index) {
                  if (similarEvents[index].Title == widget.title) {
                    return Visibility(visible: false, child: SizedBox());
                  }

                  return SimilarEventTile(
                    imgUrl: similarEvents[index].Img,
                    title: similarEvents[index].Title,
                    genre: similarEvents[index].Genre,
                    time: similarEvents[index].DateandTime,
                    day: similarEvents[index].Day,
                    desc: similarEvents[index].Desc,
                    venue: similarEvents[index].Venue,
                    poster: similarEvents[index].Poster != 'null'
                        ? similarEvents[index].Poster
                        : similarEvents[index].Img,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
