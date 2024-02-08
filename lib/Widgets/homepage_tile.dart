import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Screens/event_detail_screen.dart';

import '../Provider/Data_provider.dart';

class HomePageCard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String genre;
  final DateTime date;
  final String desc;
  final String venue;
  final int day;
  final String poster;

  const HomePageCard(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.genre,
      required this.date,
      required this.desc,
      required this.venue,
      required this.day,
      required this.poster})
      : super(key: key);

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

String formatDateTime(DateTime dateTime) {
  String formattedDate =
      DateFormat('MMMM d').format(dateTime); // Full month name and day
  String formattedTime = DateFormat.jm().format(dateTime); // Time with AM/PM

  return '$formattedDate, $formattedTime';
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    bool network = Provider.of<DataProvider>(context, listen: false).network;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // fetch data from hive
          return EventDetailScreen(
            genre: widget.genre,
            title: widget.title,
            day: widget.day,
            time: formatDateTime(widget.date),
            desc: widget.desc,
            venue: widget.venue,
            imgUrl: widget.imgUrl,
            poster: widget.poster,
          );
        }));
      },
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Card(
            elevation: 10.0,
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(
                color: Colors.black, // Set border color here
                width: 2.0, // Set border width here
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  if (network == true) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Card();
                  }
                },
                fit: BoxFit.cover,
                imageUrl: widget.imgUrl,
                errorWidget: (context, url, error) {
                  return const Card();
                },
              ),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 5,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.91,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    wordSpacing: 3,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
