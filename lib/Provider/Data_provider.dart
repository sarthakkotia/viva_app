import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  List<EventModel> PronitesList = [];
  Map<int, List<EventModel>> fetcheddata = {};
  List<List<EventModel>> days = [];
  bool network = true;

  // this function checks if the "id" field in the "events" document of the "Data" collection
  // is the same in both the local cache and on the server. It returns true if the values match
  // or false if there's an error or a mismatch.

  Future<bool> checkInternetAccess() async {
    ConnectivityResult res = await (Connectivity().checkConnectivity());
    if (res == ConnectivityResult.wifi || res == ConnectivityResult.mobile) {
      network = true;
    } else {
      network = false;
    }
    return network;
  }

  Future<bool> Checkid() async {
    try {
      var value = await _db
          .collection("Data")
          .doc("events")
          .get(const GetOptions(source: Source.cache));
      final int cacheid = value.get("id") as int;
      if (network == true) {
        value = await _db.collection("Data").doc("events").get();
        final int serverid = value.get("id") as int;
        return cacheid == serverid;
      } else {
        return false;
      }
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
      case "Pronite":
        return PronitesList;
    }
    return allEventList;
  }

  Future<EventsList> fetchFromFirebase(bool val) async {
    await Hive.openBox<EventsList>("Events");
    Box<EventsList> EventsListbox = Hive.box<EventsList>("Events");
    if (val == false || network == true) {
      //get data from server or cache
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
        FashionList.isEmpty ||
        PronitesList.isEmpty) {
      EventsList el = EventsListbox.get(0)!;
      for (var event in el.ls) {
        switch (event.Genre) {
          case "Art":
            ArtList.add(event);
            break;
          case "Dance":
            if (DanceList.isNotEmpty &&
                event.Title.split(" ")[0] ==
                    DanceList.last.Title.split(" ")[0]) {
              int idx = DanceList.length;
              EventModel temp = DanceList.last;
              DanceList.removeAt(idx - 1);
              DanceList.add(event);
              DanceList.add(temp);
              break;
            }
            DanceList.add(event);
            break;
          case "Drama":
            if (DramaList.isNotEmpty &&
                event.Title.split(" ")[0] ==
                    DramaList.last.Title.split(" ")[0]) {
              int idx = DramaList.length;
              EventModel temp = DramaList.last;
              DramaList.removeAt(idx - 1);
              DramaList.add(event);
              DramaList.add(temp);
              break;
            }
            DramaList.add(event);
            break;
          case "Music":
            if (MusicList.isNotEmpty &&
                event.Title.split(" ")[0] ==
                    MusicList.last.Title.split(" ")[0]) {
              int idx = MusicList.length;
              EventModel temp = MusicList.last;
              MusicList.removeAt(idx - 1);
              MusicList.add(event);
              MusicList.add(temp);
              break;
            }
            MusicList.add(event);
            break;
          case "Quiz":
            QuizList.add(event);
            break;
          case "Speaking Arts":
            if (SpeakingArtsList.isNotEmpty &&
                event.Title.split(" ")[0] ==
                    SpeakingArtsList.last.Title.split(" ")[0]) {
              int idx = SpeakingArtsList.length;
              EventModel temp = SpeakingArtsList.last;
              SpeakingArtsList.removeAt(idx - 1);
              SpeakingArtsList.add(event);
              SpeakingArtsList.add(temp);
              break;
            }
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
            if (FashionList.isNotEmpty &&
                event.Title.split(" ")[0] ==
                    FashionList.last.Title.split(" ")[0]) {
              int idx = FashionList.length;
              EventModel temp = FashionList.last;
              FashionList.removeAt(idx - 1);
              FashionList.add(event);
              FashionList.add(temp);
              break;
            }
            FashionList.add(event);
            break;
          case "Pronite":
            PronitesList.add(event);
            break;
        }
      }

      fetcheddata = {
        0: PronitesList,
        1: DanceList,
        2: MusicList,
        3: DramaList,
        4: ExcitingList,
        5: PhotographyList,
        6: SpeakingArtsList,
        7: NukkadList,
        8: FashionList,
        9: ArtList,
        10: QuizList,
        11: SocialList
      };
      return;
    }
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
