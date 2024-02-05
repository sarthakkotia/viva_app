import 'package:viva_app/Models/EventModelwithHive.dart';

class GenresList {
  List<EventModel> Drama;
  List<EventModel> Dance;
  List<EventModel> Music;
  List<EventModel> Quiz;
  List<EventModel> SpeakingArts;
  List<EventModel> Photography;
  List<EventModel> Nukkad;
  List<EventModel> Exciting;
  List<EventModel> Social;
  List<EventModel> Fashion;

  GenresList({
    required this.Dance,
    required this.Drama,
    required this.Music,
    required this.Quiz,
    required this.SpeakingArts,
    required this.Photography,
    required this.Nukkad,
    required this.Exciting,
    required this.Social,
    required this.Fashion,
  });
}
