import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:viva_app/Models/EventModelwithHive.dart';
import 'package:viva_app/Models/EventsList.dart';
import 'package:viva_app/Models/Genres_List_Model.dart';

class DataProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  List<EventModel> allEventList = [];
  List<EventModel> DanceList = [];
  List<EventModel> MusicList = [];
  List<EventModel> QuizList = [];
  List<EventModel> ArtList = [];
  List<EventModel> SpeakingArtsList = [];
  List<EventModel> PhotographyList = [];
  List<EventModel> NukkadList = [];
  List<EventModel> ExcitingList = [];
  List<EventModel> DramaList = [];
  List<EventModel> SocialList = [];
  List<EventModel> FashionList = [];
  List<EventModel> day9 = [];
  List<EventModel> day10 = [];
  List<EventModel> day11 = [];

  Future<bool> Checkid() async {
    try {
      var value = await _db
          .collection("Data")
          .doc("events")
          .get(const GetOptions(source: Source.cache));
      final int cacheid = value.get("id") as int;
      value = await _db.collection("Data").doc("events").get();
      final int serverid = value.get("id") as int;
      return cacheid == serverid;
    } catch (e) {
      return false;
    }
  }

  Future<EventsList> fetchFromFirebase(bool val) async {
    await Hive.openBox<EventsList>("Events");
    Box<EventsList> EventsListbox = Hive.box<EventsList>("Events");
    if (val == false) {
      final data = await _db
          .collection("Data")
          .doc("events")
          .collection("Events")
          .get(const GetOptions(source: Source.serverAndCache));
      for (var event in data.docs) {
        final val = event.data();
        EventModel em = EventModel(
            Title: val["Title"],
            DateandTime: (val["Date & Time"] as Timestamp).toDate(),
            Day: val["Day"],
            Desc: val["Desc"],
            Genre: val["Genre"],
            Img: val["Img"],
            Venue: val["Venue"]);
        allEventList.add(em);
      }
      EventsListbox.put(
          0,
          EventsList(
            ls: allEventList,
          ));
    } else {
      if (allEventList.isEmpty) {
        final data = await _db
            .collection("Data")
            .doc("events")
            .collection("Events")
            .get(const GetOptions(source: Source.cache));
        for (var event in data.docs) {
          final val = event.data();
          EventModel em = EventModel(
              Title: val["Title"],
              DateandTime: (val["Date & Time"] as Timestamp).toDate(),
              Day: val["Day"],
              Desc: val["Desc"],
              Genre: val["Genre"],
              Img: val["Img"],
              Venue: val["Venue"]);
          allEventList.add(em);
        }
        EventsListbox.put(0, EventsList(ls: allEventList));
        return EventsList(ls: allEventList);
      } else {
        return EventsList(ls: allEventList);
      }
    }
    final res = EventsListbox.get(0);
    return res!;
  }

  GenresList fetchGenreList() {
    Box<EventsList> EventsListbox = Hive.box<EventsList>("Events");
    if (DanceList.isEmpty ||
        DramaList.isEmpty ||
        MusicList.isEmpty ||
        QuizList.isEmpty ||
        SpeakingArtsList.isEmpty ||
        PhotographyList.isEmpty ||
        NukkadList.isEmpty ||
        ExcitingList.isEmpty ||
        SocialList.isEmpty ||
        FashionList.isEmpty) {
      EventsList el = EventsListbox.get(0)!;
      for (var event in el.ls) {
        switch (event.Genre) {
          case "Art":
            ArtList.add(event);
          case "Dance":
            DanceList.add(event);
            break;
          case "Drama":
            DramaList.add(event);
            break;
          case "Music":
            MusicList.add(event);
            break;
          case "Quiz":
            QuizList.add(event);
            break;
          case "SpeakingArts":
            SpeakingArtsList.add(event);
            break;
          case "Photography":
            PhotographyList.add(event);
            break;
          case "Nukkad":
            NukkadList.add(event);
            break;
          case "Exciting":
            ExcitingList.add(event);
            break;
          case "Social":
            SocialList.add(event);
            break;
          case "Fashion":
            FashionList.add(event);
            break;
        }
      }
      var gl = GenresList(
          Dance: DanceList,
          Drama: DramaList,
          Music: MusicList,
          Quiz: QuizList,
          SpeakingArts: SpeakingArtsList,
          Photography: PhotographyList,
          Nukkad: NukkadList,
          Exciting: ExcitingList,
          Social: SocialList,
          Fashion: FashionList);
      return gl;
    }
    var gl = GenresList(
        Dance: DanceList,
        Drama: DramaList,
        Music: MusicList,
        Quiz: QuizList,
        SpeakingArts: SpeakingArtsList,
        Photography: PhotographyList,
        Nukkad: NukkadList,
        Exciting: ExcitingList,
        Social: SocialList,
        Fashion: FashionList);
    return gl;
  }

  List<List<EventModel>> fetchDaysList() {
    Box<EventsList> EventsListbox = Hive.box<EventsList>("Events");
    for (var event in EventsListbox.get(0)!.ls) {
      switch (event.Day) {
        case 9:
          day9.add(event);
          break;
        case 10:
          day10.add(event);
          break;
        case 11:
          day11.add(event);
          break;
      }
    }
    return [day9, day10, day11];
  }
}
