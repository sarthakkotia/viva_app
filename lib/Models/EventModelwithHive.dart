import 'package:hive/hive.dart';

part 'EventModelwithHive.g.dart';

@HiveType(typeId: 0)
class EventModel extends HiveObject {
  @HiveField(0)
  final String Title;
  @HiveField(1)
  final String Desc;
  @HiveField(2)
  final String Img;
  @HiveField(3)
  final String Genre;
  @HiveField(4)
  final DateTime DateandTime;
  @HiveField(5)
  final String Venue;
  @HiveField(6)
  final int Day;
  @HiveField(7)
  final String Poster;

  EventModel(
      {required this.Title,
      required this.DateandTime,
      required this.Day,
      required this.Desc,
      required this.Genre,
      required this.Img,
      required this.Venue,
      required this.Poster});
}
