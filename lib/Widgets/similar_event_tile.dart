import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Screens/event_detail_screen.dart';

import '../Provider/Data_provider.dart';

class SimilarEventTile extends StatefulWidget {
  final String imgUrl;
  final String genre;
  final String title;
  final DateTime time;
  final int day;
  final String desc;
  final String venue;
  final String poster;
  const SimilarEventTile(
      {Key? key,
      required this.title,
      required this.imgUrl,
      required this.genre,
      required this.time,
      required this.day,
      required this.desc,
      required this.venue,
      required this.poster})
      : super(key: key);

  @override
  State<SimilarEventTile> createState() => _SimilarEventTileState();
}

String formatDateTime(DateTime dateTime) {
  // Use intl package for formatting
  String formattedDate =
      DateFormat('MMMM d').format(dateTime); // Full month name and day
  String formattedTime = DateFormat.jm().format(dateTime); // Time with AM/PM

  return '$formattedDate, $formattedTime';
}

class _SimilarEventTileState extends State<SimilarEventTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventDetailScreen(
              genre: widget.genre,
              title: widget.title,
              time: formatDateTime(widget.time),
              desc: widget.desc,
              venue: widget.venue,
              day: widget.day,
              imgUrl: widget.imgUrl,
              poster: widget.poster);
        }));
      },
      child: Column(
        children: [
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
                imageUrl: widget.imgUrl,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300], // Placeholder color while loading
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 8.0), // Add some spacing between the Card and Text
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
