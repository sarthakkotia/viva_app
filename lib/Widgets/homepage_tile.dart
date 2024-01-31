import 'package:flutter/material.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard({Key? key}) : super(key: key);

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(child: Text("wffw") //Image.asset(),
        );
  }
}
