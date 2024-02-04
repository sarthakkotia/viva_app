import 'package:flutter/material.dart';
import 'package:viva_app/Screens/event_detail_screen.dart';
import 'package:viva_app/Screens/test2_screen.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard({Key? key}) : super(key: key);

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(child: Image.asset("assets/Logos/linkedinlogo.png")),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventDetailScreen();
        }));
      },
    );
  }
}
