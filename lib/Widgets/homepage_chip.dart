import 'package:flutter/material.dart';

class HomePageChip extends StatefulWidget {
  const HomePageChip(
      {required this.title,
      required this.icon,
      required this.onPressed,
      Key? key})
      : super(key: key);

  final String title;
  final String icon;
  final VoidCallback onPressed;

  @override
  State<HomePageChip> createState() => _HomePageChipState();
}

class _HomePageChipState extends State<HomePageChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: EdgeInsets.all(8),
      surfaceTintColor: Colors.purple,
      label: Text(widget.title),
      selected: false,
      avatar: Image.asset(widget.icon),
    );
    // return Chip(
    //   label: Text(widget.title),
    //   avatar: GestureDetector(
    //     onTap: widget.onPressed,
    //     child: Image.asset(widget.icon),
    //   ),
    // ).animate().moveX().fade();
  }
}
