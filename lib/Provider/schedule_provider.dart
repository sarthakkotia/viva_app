import 'dart:core';

import 'package:flutter/material.dart';
import 'package:viva_app/Models/ScheduleListModel.dart';

class ScheduleDataProvider with ChangeNotifier {
  List<ScheduleModel> _scheduleData = [];

  List<ScheduleModel> get scheduleData {
    return [..._scheduleData];
  }

  Future<void> fetchData() async {
    //TODO: fetch data from firebase
    _scheduleData.add(ScheduleModel(
        title: "Title0",
        venue: "CP0",
        dateTime: DateTime(2024, 2, 1),
        description: "description0",
        imagedata: Image.asset("assets/Logos/9feb.png")));
    _scheduleData.add(ScheduleModel(
        title: "Title1",
        venue: "CP1",
        dateTime: DateTime(2024, 2, 2),
        description: "description1",
        imagedata: Image.asset("assets/Logos/9feb.png")));
    _scheduleData.add(ScheduleModel(
        title: "Title1",
        venue: "CP1",
        dateTime: DateTime(2024, 2, 2),
        description: "description1",
        imagedata: Image.asset("assets/Logos/9feb.png")));
    _scheduleData.add(ScheduleModel(
        title: "Title2",
        venue: "CP2",
        dateTime: DateTime(2024, 2, 3),
        description: "description2",
        imagedata: Image.asset("assets/Logos/10feb.png")));
    _scheduleData.add(ScheduleModel(
        title: "Title3",
        venue: "CP3",
        dateTime: DateTime(2024, 2, 4),
        description: "description3",
        imagedata: Image.asset("assets/Logos/11feb.png")));
  }

  List<ScheduleModel> Dayindexdetails(int index) {
    List<ScheduleModel> Day = [];
    for (var element in _scheduleData) {
      if (element.dateTime.day == index + 1) {
        Day.add(element);
      }
    }
    return Day;
  }
}
