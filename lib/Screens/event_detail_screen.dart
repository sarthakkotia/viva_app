import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Widgets/similar_event_tile.dart';

import '../Provider/Data_provider.dart';

// fetcheddata = {
// 0: DanceList,
// 1: DramaList,
// 2: MusicList,
// 3: QuizList,
// 4: SpeakingArtsList,
// 5: PhotographyList,
// 6: NukkadList,
// 7: ExcitingList,
// 8: SocialList,
// 9: FashionList,
// };

class EventDetailScreen extends StatefulWidget {
  final String imgUrl;
  final String genre;
  final String title;
  final DateTime time;
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
  // DataProvider data_provider =
  //     Provider.of<DataProvider>(context, listen: false);
  // var fetchedLists = data_provider.fetcheddata;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: widget.poster,
            fit: BoxFit.cover,
            height: 350.0, // Set the desired height for the poster image
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.blue), // Set icon color here
                SizedBox(width: 8.0),
                Text(
                  "Genre",
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
                Icon(Icons.location_pin,
                    color: Colors.blue), // Set icon color here
                SizedBox(width: 8.0),
                Text(
                  widget.genre,
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
                Icon(Icons.calendar_today_sharp,
                    color: Colors.blue), // Set icon color here
                SizedBox(width: 8.0),
                Text(
                  widget.day.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.desc,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Similar Events",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(itemBuilder: (context, index) {
            return SimilarEventTile();
          })
        ],
      ),
    );
  }
}
