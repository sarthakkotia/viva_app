import 'package:flutter/material.dart';

class HomePageChip extends StatefulWidget {
  HomePageChip({required this.title, required this.icon, Key? key})
      : super(key: key);
  String title;
  String icon;
  @override
  State<HomePageChip> createState() => _HomePageChipState();
}

class _HomePageChipState extends State<HomePageChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(widget.title),
      avatar: GestureDetector(onTap: () {}, child: Image.asset(widget.icon)),
    );
  }
}
