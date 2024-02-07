import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Data_provider.dart';

class SimilarEventTile extends StatefulWidget {
  const SimilarEventTile({Key? key}) : super(key: key);

  @override
  State<SimilarEventTile> createState() => _SimilarEventTileState();
}

class _SimilarEventTileState extends State<SimilarEventTile> {
  @override
  Widget build(BuildContext context) {
    DataProvider data_provider =
    Provider.of<DataProvider>(context, listen: false);

    return Card(

    );
  }
}
