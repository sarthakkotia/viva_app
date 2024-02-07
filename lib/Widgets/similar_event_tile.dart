import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Data_provider.dart';

class SimilarEventTile extends StatefulWidget {
  final String title;
  final String imgUrl;
  const SimilarEventTile({Key? key, required this.title, required this.imgUrl})
      : super(key: key);

  @override
  State<SimilarEventTile> createState() => _SimilarEventTileState();
}

class _SimilarEventTileState extends State<SimilarEventTile> {
  @override
  Widget build(BuildContext context) {
    DataProvider data_provider =
        Provider.of<DataProvider>(context, listen: false);

    return Column(
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
              // errorWidget: (context, url, error) => Icon(Icons.error), // You can customize the error widget
            ),
          ),
        ),
        SizedBox(height: 8.0), // Add some spacing between the Card and Text
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );

  }
}
