import "package:flutter/material.dart";

class ScheduleModel {
  String title;
  String venue;
  DateTime dateTime;
  String description;
  Image imagedata;

  ScheduleModel(
      {required this.title,
      required this.venue,
      required this.dateTime,
      required this.description,
      required this.imagedata});
}
