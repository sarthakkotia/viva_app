import 'package:hive/hive.dart';
import 'package:viva_app/Models/EventModelwithHive.dart';

part 'EventsList.g.dart';

@HiveType(typeId: 6)
class EventsList extends HiveObject {
  @HiveField(0)
  List<EventModel> ls;

  EventsList({required this.ls});
}
