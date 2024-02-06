import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    return Chip(
      label: Text(widget.title),
      avatar: GestureDetector(
        onTap: widget.onPressed,
        child: Image.asset(widget.icon),
      ),
    ).animate().moveX().fade();
  }
}
