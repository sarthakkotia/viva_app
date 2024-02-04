import 'package:cloud_firestore/cloud_firestore.dart';

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class Logic {
  final db = FirebaseFirestore.instance;

  String fx(String str) {
    return str.split(' ').map((word) => word.capitalize()).join(' ');
    ;
  }

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
    // final snapshot = await db.collection("Data").doc("events").get();
    // final data = snapshot.data() as Map<String, dynamic>;
    // if (data["id"] == 0) {
    //   final snapshot0 =
    //       await db.collection("Data").doc("events").collection("Events").get();
    //   List<dynamic> day0 = [];
    //   List<dynamic> day1 = [];
    //   List<dynamic> day2 = [];
    //   for (var event in snapshot0.docs) {
    //     final data = event.data();
    //     if (data["day"] == 0) {
    //       print("${event.id}=>${event.data()}");
    //       day0.add(data);
    //     } else if (data["day"] == 0) {
    //       day1.add(data);
    //       print("${event.id}=>${event.data()}");
    //     } else {
    //       day1.add(data);
    //       print("${event.id}=>${event.data()}");
    //     }
    //   }
    // }

    List<dynamic> ls = [
      {
        "Title": fx('Jamming Night'),
        "Day": 9,
        "Desc":
            'A night of music and camaraderie! Join us as we gather around a campfire with the people we adore, and the music we love. A night to never be forgotten!',
        "Img": 'https://d3lhw1p67h4h5r.cloudfront.net/Jamming.webp',
        "Venue": "NIL",
        "Genre": "Exciting",
        "Date & Time": FieldValue.serverTimestamp(),
      },
      {
        "Title": fx('Jamming Night'),
        "Day": 10,
        "Desc":
            'A night of music and camaraderie! Join us as we gather around a campfire with the people we adore, and the music we love. A night to never be forgotten!',
        "Img": 'https://d3lhw1p67h4h5r.cloudfront.net/Jamming.webp',
      },
      {
        "Title": fx('Jamming Night'),
        "Day": 11,
        "Desc":
            'A night of music and camaraderie! Join us as we gather around a campfire with the people we adore, and the music we love. A night to never be forgotten!',
        "Img": 'https://d3lhw1p67h4h5r.cloudfront.net/Jamming.webp',
        "Venue": "NIL",
        "Genre": "Exciting",
        "Date & Time": FieldValue.serverTimestamp(),
      },
    ];

    final snapshot = await db
        .collection("Data")
        .doc("events")
        .collection("Events")
        .doc("Jamming Night-1")
        .set(ls[0]);
    final snapshotw = await db
        .collection("Data")
        .doc("events")
        .collection("Events")
        .doc("Jamming Night-2")
        .set(ls[1]);
    final snapshotr = await db
        .collection("Data")
        .doc("events")
        .collection("Events")
        .doc("Jamming Night-3")
        .set(ls[2]);
    print("check now");

    //   final snapshot = await db.collection("Data").doc("events").collection("Events").doc("")
    //   print(stopwatch.elapsed);
    //   stopwatch.stop();
    //   var eventsData = [
    //     {
    //       "category": 'Pronites',
    //       data: [
    //         {
    //           Title: 'DAY1',
    //           Day: '9 FEB',
    //           Desc:
    //               'Film Making Competition: Script, shoot, and edit your way to make your story the most memorable of all!',
    //           Prize: 'PRIZE POOL 70K',
    //           PrizeDesc: '',
    //           Color: '#FFF500',
    //           Img: '',
    //         },
    //         {
    //           Title: 'DAY1',
    //           Day: '9 FEB',
    //           Desc:
    //               'A photobooth to make these days more memorable. Caution: The nostalgia induced by these pictures is bound to be painful.',
    //           Prize: '',
    //           PrizeDesc: '',
    //           Color: '#00FFF0',
    //           Img: '',
    //         },
    //         {
    //           Title: 'DAY 2',
    //           Day: '10 FEB',
    //           Desc:
    //               'Solve clues, recreate frames, and immortalize moments in this campus-wide photography adventure.',
    //           Prize: 'PRIZE POOL 40K',
    //           PrizeDesc: '',
    //           Color: '#FF6B00',
    //           Img: '',
    //         },
    //         {
    //           Title: 'DAY 2',
    //           Day: '10 FEB',
    //           Desc:
    //               'Pre-defined themes and your lenses against the beautiful canvas of the world. Let your creativity show in this battle of pictures!',
    //           Prize: 'PRIZE POOL 40K',
    //           PrizeDesc: '',
    //           Color: '#00FFF0',
    //           Img: '',
    //         },
    //         {
    //           Title: 'DAY 3',
    //           Day: '11 FEB',
    //           Desc:
    //               'This is a Group Dance Competition. Team Size - Minimum of 8 and maximum of 30 members are allowed in a team with at least 6 and at ',
    //           Prize: '',
    //           PrizeDesc: '',
    //           Color: '#FF6B00',
    //           Img: '',
    //         },
    //         {
    //           Title: 'DAY 3',
    //           Day: '11 FEB',
    //           Desc:
    //               'The best clicks from the best! A showcase of imagination by our photography club: Imagination.',
    //           Prize: '',
    //           PrizeDesc: '',
    //           Color: '#FFF500',
    //           Img: '',
    //         },
    //       ],
    //       Rulebook: '',
    //     },
    //     {
    //       category: 'DanceEvents',
    //       data: [
    //         {
    //           Title: 'Razzmatazz',
    //           Day: '9 FEB',
    //           Desc:
    //               'Set the stage on fire as you unleash the rhythm and showcase your choreography in this dance battle.',
    //           Prize: 'PRIZE CASH 50K',
    //           PrizeDesc: '& additional worth 50K',
    //           Color: '#FFF500',
    //           Img: 'https://d3lhw1p67h4h5r.cloudfront.net/D1.webp',
    //         },
    //         {
    //           Title: 'street dance',
    //           Day: '10 FEB',
    //           Desc:
    //               'Let the streets bear witness to electrifying performances and exhilarating beats. Let your spirits soar with street dance! ',
    //           Prize: 'PRIZE CASH 25K',
    //           PrizeDesc: '& additional worth 30K',
    //           Color: '#00FFF0',
    //           Img: 'https://d3lhw1p67h4h5r.cloudfront.net/D2.webp',
    //         },
    //         {
    //           Title: 'Let’s tangle',
    //           Day: '10 FEB',
    //           Desc:
    //               'Set the stage on fire as you unleash the rhythm and showcase your choreography in this dance battle.',
    //           Prize: 'PRIZE POOL 60K',
    //           PrizeDesc: '',
    //           Color: '#FF6B00',
    //           Img: 'https://d3lhw1p67h4h5r.cloudfront.net/D3.webp',
    //         },
    //         {
    //           Title: 'MUDRA',
    //           Day: '9 FEB',
    //           Desc:
    //               'Explore the allure of the classical arts! Let light descend onto the stage as you enamor yourself in elegant styles and witness the roots of dance itself!',
    //           Prize: 'PRIZE POOL 40K',
    //           PrizeDesc: '',
    //           Color: '#FF6B00',
    //           Img: 'https://d3lhw1p67h4h5r.cloudfront.net/D4.webp',
    //         },
    //         {
    //           Title: 'pump it up',
    //           Day: '10 FEB',
    //           Desc:
    //               'Let the beats flow and your body move! Engage yourself in solo western performances where rhythm is everything.',
    //           Prize: 'PRIZE POOL 40K',
    //           PrizeDesc: '',
    //           Color: '#FFF500',
    //           Img: 'https://d3lhw1p67h4h5r.cloudfront.net/D5.webp',
    //         },
    //       ],
    //       Rulebook:
    //           'https://d3lhw1p67h4h5r.cloudfront.net/Insignia+Rulebook+(updated).pdf',
    //     },
    //
    //     {
    //       category: 'DramaEvents',
    //       data: [
    //
    //       ],
    //       Rulebook:
    //           'https://d3lhw1p67h4h5r.cloudfront.net/Rendition+Rule+Book_24.pdf',
    //     },
    //     {
    //       category: 'MusicEvents',
    //       data: [
    //
    //       ],
    //       Rulebook:
    //           'https://d3lhw1p67h4h5r.cloudfront.net/Capriccio+(Music+Events+Detail).pdf',
    //     },
    //     {
    //       category: 'photographyEvents',
    //       data: [
    //
    //       ],
    //       Rulebook:
    //           'https://d3lhw1p67h4h5r.cloudfront.net/IMAGINATION+RULEBOOK-1.pdf',
    //     },
    //     {
    //       category: 'ArtEvents',
    //       data: [
    //
    //       ],
    //       Rulebook: 'https://d3lhw1p67h4h5r.cloudfront.net/vignette+Rulebook.pdf',
    //     },
    //     {
    //       category: 'QuizEvents',
    //       data: [
    //
    //       ],
    //       Rulebook: 'https://d3lhw1p67h4h5r.cloudfront.net/QUIZZINGA.pdf',
    //     },
    //     {
    //       category: 'FashionEvents',
    //       data: [
    //
    //       ],
    //       Rulebook:
    //           'https://d3lhw1p67h4h5r.cloudfront.net/EMINENCE+Rule+Book.pdf',
    //     },
    //     {
    //       category: 'NukkadEvents',
    //       data: [
    //
    //       ],
    //       Rulebook: 'https://d3lhw1p67h4h5r.cloudfront.net/AAVEG+Rule+Book.pdf',
    //     },
    //     {
    //       category: 'SocialEvents',
    //       data: [
    //         {
    //           Title: 'sahyog',
    //           Day: '9 FEB',
    //           Desc:
    //               "Help us do our part! Let's extend a hand to the less fortunate. A show just for the homeless children, as we provide them a platform to showcase their own talents and assist them in receiving the support for their dreams that they need. This is sahyog: the helping hand.",
    //           Prize: '',
    //           PrizeDesc: '',
    //           Color: '#00FFF0',
    //           Img: 'https://d3lhw1p67h4h5r.cloudfront.net/Sahyog.webp',
    //         },
    //       ],
    //       Rulebook: 'https://d3lhw1p67h4h5r.cloudfront.net/SANKALP.pdf',
    //     },
    //     {
    //       category: 'ExcitingEvents',
    //       data: [
    //
    //       ],
    //       Rulebook: '',
    //     },
    //   ];
  }
}
