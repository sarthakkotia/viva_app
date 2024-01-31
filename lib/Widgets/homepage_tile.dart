import 'package:flutter/material.dart';

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
      onTap: () {},
    );
  }
}
