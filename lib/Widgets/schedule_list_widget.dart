import "package:flutter/material.dart";
import "package:viva_app/Widgets/schedule_list_tile.dart";

import "../Models/ScheduleListModel.dart";

class ScheduleList extends StatefulWidget {
  final List<ScheduleModel> list;

  const ScheduleList(this.list, {super.key});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    List<ScheduleModel> list = widget.list;
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemCount: list.length,
        itemBuilder: (context, itemIndex) {
          return CustomListTile(
            title: list[itemIndex].title,
            venue: list[itemIndex].venue,
            time: '10:00 AM',
            eventDescription: list[itemIndex].description,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 10,
            thickness: 0,
          );
        },
      ),
    );
  }
}
