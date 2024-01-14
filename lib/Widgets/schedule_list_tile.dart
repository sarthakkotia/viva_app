import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ListTile extends StatefulWidget {
  const ListTile({Key? key}) : super(key: key);

  @override
  State<ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text("Event Name"),
      children: [Container()],
    );
  }
}
