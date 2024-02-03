import 'package:cloud_firestore/cloud_firestore.dart';

class Logic {
  final db = FirebaseFirestore.instance;

  Future<void> fetchData() async {
    //TODO: GET ID FOR THE SCHEDULE
    // final snapshot = await db.collection("Schedule").doc("vivaSchedule").get();
    // final data = snapshot.data() as Map<String, dynamic>;
    // print(data["id"]);
    // for (var message in snapshot.docs) {
    //   print(message.data());
    // }
    //TODO:FETCH DAYS DATA
    // final snapshot0 = await db
    //     .collection("Schedule")
    //     .doc("vivaSchedule")
    //     .collection("Days")
    //     .doc("Day0")
    //     .collection("Events")
    //     .get();
    // final snapshot1 = await db
    //     .collection("Schedule")
    //     .doc("vivaSchedule")
    //     .collection("Days")
    //     .doc("Day1")
    //     .collection("Events")
    //     .get();
    // final snapshot2 = await db
    //     .collection("Schedule")
    //     .doc("vivaSchedule")
    //     .collection("Days")
    //     .doc("Day2")
    //     .collection("Events")
    //     .get();
    // //print all the docs in the list of that collection
    // for (var events in snapshot0.docs) {
    //   print("${events.id} => ${events.data()}");
    // }
    // for (var events in snapshot1.docs) {
    //   print("${events.id} => ${events.data()}");
    // }
    // for (var events in snapshot2.docs) {
    //   print("${events.id} => ${events.data()}");
    // }
    // // List<List<dynamic>>Days=[[]];
    // // for(int i=0;i<3;i++){
    // //   Days[i] =
    // // }
    //TODO: FETCH DATA AS JSON
    final stopwatch = Stopwatch();
    stopwatch.start();
    // final snapshot = await db.collection("Schedule").doc("vivaSchedule").get();
    // final data = snapshot.data() as Map<String, dynamic>;
    // if (data["id"] == 0) {
    //   final snapshot0 = await db
    //       .collection("Schedule")
    //       .doc("vivaSchedule")
    //       .collection("Days")
    //       .doc("Day0")
    //       .collection("Events")
    //       .get();
    //   for (var event in snapshot0.docs) {
    //     print("${event.id}=>${event.data()}");
    //   }
    //   final snapshot1 = await db
    //       .collection("Schedule")
    //       .doc("vivaSchedule")
    //       .collection("Days")
    //       .doc("Day1")
    //       .collection("Events")
    //       .get();
    //   for (var event in snapshot1.docs) {
    //     print("${event.id}=>${event.data()}");
    //   }
    //   final snapshot2 = await db
    //       .collection("Schedule")
    //       .doc("vivaSchedule")
    //       .collection("Days")
    //       .doc("Day2")
    //       .collection("Events")
    //       .get();
    //   for (var event in snapshot2.docs) {
    //     print("${event.id}=>${event.data()}");
    //   }
    // }
    // print(stopwatch.elapsed);
    // stopwatch.stop();
    final snapshot = await db.collection("Data").doc("events").get();
    final data = snapshot.data() as Map<String, dynamic>;
    if (data["id"] == 0) {
      final snapshot0 =
          await db.collection("Data").doc("events").collection("Events").get();
      List<dynamic> day0 = [];
      List<dynamic> day1 = [];
      List<dynamic> day2 = [];
      for (var event in snapshot0.docs) {
        final data = event.data();
        if (data["day"] == 0) {
          print("${event.id}=>${event.data()}");
          day0.add(data);
        } else if (data["day"] == 0) {
          day1.add(data);
          print("${event.id}=>${event.data()}");
        } else {
          day1.add(data);
          print("${event.id}=>${event.data()}");
        }
      }
    }
    print(stopwatch.elapsed);
    stopwatch.stop();
  }
}
