import "dart:core";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

// import "../Models/Test2.dart";

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirebaseScreen>
    with TickerProviderStateMixin {
  // late Box<Test2> test2box;

  void Checkid() async {
    final _db = FirebaseFirestore.instance;
    var value = await _db
        .collection("Data")
        .doc("events")
        .get(const GetOptions(source: Source.cache));
    final int cacheid = value.get("id") as int;
    value = await _db.collection("Data").doc("events").get();
    final int serverid = value.get("id") as int;

    if (cacheid == serverid) {
      print("true");
    }
  }

  @override
  void initState() {
    Checkid();
    // test2box = Hive.box<Test2>("Data");
    // danceBox = Hive.box<DanceModelHive>("Dance");
    /*
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    final db = FirebaseFirestore.instance;
    db
        .collection("Data")
        .doc("events")
        .get(GetOptions(source: Source.cache))
        .then((value) {
      print("ijfgogkgg");
      print(value);
    });
    final serverid = db.collection("Data").doc("events").get();
    print((serverid.then((value) {
      final data = value.data() as Map<String, dynamic>;
      print("server id");
      print(data["id"]);
    })));
    db
        .collection("Data")
        .doc("events")
        .get(GetOptions(source: Source.cache))
        .then((value) {
      final data = value.data() as Map<String, dynamic>;
      print(data["id"]);
    })
    ;
     */
    /*
    db.collection("Data").doc("events").get().then((value) {
      print(value.data());
      final data = value.data() as Map<String, dynamic>;
      print("checking");

      if (test2box.get(data["id"]).runtimeType == Null) {
        List<EventModel> lst = [];
        List<EventModel> lsd = [];
        db.collection("Data").get(GetOptions(source: Source.cache));
        db
            .collection("Data")
            .doc("events")
            .collection("Events")
            .get()
            .then((value) {
          for (var event in value.docs) {
            final data = event.data();
            EventModel em = EventModel(
                Title: data["Title"],
                DateandTime: (data["Date & Time"] as Timestamp).toDate(),
                Day: data["Day"],
                Desc: data["Desc"],
                Genre: data["Genre"],
                Img: data["Img"],
                Venue: data["Venue"]);
            lst.add(em);
            switch (data["Genre"]) {
              case "Dance":
                print("${em.Title} to dance");
                lsd.add(em);
            }
            print("${em.Title} added to main hive");
          }
          test2box.put(data["id"], Test2(id: data["id"], ls: lst));
          danceBox.put(0, DanceModelHive(ls: lsd));
          print(stopwatch.elapsed);
          stopwatch.stop();
        });
      } else {
        print("already done");
      }
    });
     */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        primary: true,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // final logic2ttt = logic2();
              // logic2ttt.run();
            },
            child: Text(""),
          ),
        ));
  }
}
