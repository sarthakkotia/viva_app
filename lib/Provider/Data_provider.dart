import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:viva_app/Models/EventModelwithHive.dart';
import 'package:viva_app/Models/EventsList.dart';

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
  Map<int, List<EventModel>> fetcheddata = {};
  List<List<EventModel>> days = [];

  // this function checks if the "id" field in the "events" document of the "Data" collection
  // is the same in both the local cache and on the server. It returns true if the values match
  // or false if there's an error or a mismatch.

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

  List<EventModel> fetchSimilarEvents(String genre) {
    switch (genre) {
      case "Dance":
        return DanceList;
      case "Drama":
        return DramaList;
      case "Music":
        return MusicList;
      case "Quiz":
        return QuizList;
      case "Art":
        return ArtList;
      case "Speaking Arts":
        return SpeakingArtsList;
      case "Photography":
        return PhotographyList;
      case "Social":
        return SocialList;
      case "Exciting":
        return ExcitingList;
      case "Fashion":
        return FashionList;
    }
    return allEventList;
  }

  Future<EventsList> fetchFromFirebase(bool val) async {
    await Hive.openBox<EventsList>("Events");
    Box<EventsList> EventsListbox = Hive.box<EventsList>("Events");

    // either cache data != serverdata or cache empty
    if (val == false) {
      final data = await _db
          .collection("Data")
          .doc("events")
          .collection("Events")
          .get(const GetOptions(source: Source.serverAndCache));
      // Causes Firestore to try to retrieve an up-to-date (server-retrieved) snapshot,
      // but fall back to returning cached data if the server can't be reached.
      for (var event in data.docs) {
        final val = event.data();
        EventModel em = EventModel(
            Title: val["Title"],
            DateandTime: (val["Date & Time"] as Timestamp).toDate(),
            Day: val["Day"],
            Desc: val["Desc"],
            Genre: val["Genre"],
            Img: val["Img"],
            Venue: val["Venue"],
            Poster: val["Poster"] == null ? "null" : val["Poster"]);
        allEventList.add(em);
      }
      EventsListbox.put(
          0,
          EventsList(
            ls: allEventList,
          ));
    } else {
      // cached and serverdata equal but not present in hive
      if (allEventList.isEmpty) {
        final data = await _db
            .collection("Data")
            .doc("events")
            .collection("Events")
            .get(const GetOptions(
                source: Source.cache)); // getting data from cache
        for (var event in data.docs) {
          final val = event.data();
          EventModel em = EventModel(
              Title: val["Title"],
              DateandTime: (val["Date & Time"] as Timestamp).toDate(),
              Day: val["Day"],
              Desc: val["Desc"],
              Genre: val["Genre"],
              Img: val["Img"],
              Venue: val["Venue"],
              Poster: val["Poster"] ?? "null");
          allEventList.add(em); // adding the data to hive
        }
        // 0 is the key
        EventsListbox.put(0, EventsList(ls: allEventList));
        return EventsList(ls: allEventList);
      } else {
        return EventsList(ls: allEventList);
      }
    }
    final res = EventsListbox.get(0);
    return res!;
  }

  void fetchGenreList() {
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
      fetcheddata = {
        0: DanceList,
        1: DramaList,
        2: MusicList,
        3: QuizList,
        4: SpeakingArtsList,
        5: PhotographyList,
        6: NukkadList,
        7: ExcitingList,
        8: SocialList,
        9: FashionList,
      };
    }
    fetcheddata = {
      0: DanceList,
      1: DramaList,
      2: MusicList,
      3: QuizList,
      4: SpeakingArtsList,
      5: PhotographyList,
      6: NukkadList,
      7: ExcitingList,
      8: SocialList,
      9: FashionList,
    };
  }

  List<List<EventModel>> fetchDaysList() {
    if (days.isEmpty) {
      List<EventModel> day9 = [];
      List<EventModel> day10 = [];
      List<EventModel> day11 = [];
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
      days = [day9, day10, day11];
      return days;
    } else {
      return days;
    }
  }
}
