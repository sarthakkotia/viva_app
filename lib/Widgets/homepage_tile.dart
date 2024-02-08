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
            elevation: 100.0,
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
                    return Card();
                  }
                },
                fit: BoxFit.cover,
                imageUrl: widget.imgUrl,
                errorWidget: (context, url, error) {
                  return Card();
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.55),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: Colors.black, // Set border color here
                  width: 2.0, // Set border width here
                ),
              ),
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
