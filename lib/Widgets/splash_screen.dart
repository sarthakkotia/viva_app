import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../Models/EventModelwithHive.dart';
import '../Models/EventsList.dart';
import '../Provider/Data_provider.dart';
import '../Provider/Services/Notifier.dart';
import '../Screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late DataProvider data_provider;
  final VideoPlayerController _controller =
      VideoPlayerController.asset('assets/Logos/logorevealvertical.mp4');
  Stopwatch stopwatch = Stopwatch();

  Future<void> setupAndInitializeHive() async {
    final dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.initFlutter("hive_db_test");
    Hive.registerAdapter<EventModel>(EventModelAdapter());
    Hive.registerAdapter<EventsList>(EventsListAdapter());
    await Hive.openBox<EventsList>("Events");
  }

  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    fcm.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    fcm.subscribeToTopic("users");
    fcm.setForegroundNotificationPresentationOptions(
        sound: true, badge: true, alert: true);
    NotificationClass nc = NotificationClass();
    nc.intitalize();
  }

  Future<List<List<EventModel>>> setupProvider() async {
    data_provider = Provider.of<DataProvider>(context, listen: false);
    await data_provider.checkInternetAccess();
    final bool val = await data_provider.Checkid();
    await data_provider.fetchFromFirebase(val);
    data_provider.fetchGenreList();
    return data_provider.fetchDaysList();
  }

  bool paused = false;

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((value) {
      _controller.setVolume(0);
      setState(() {});
      _controller.play().then((value) {
        stopwatch.start();
        setupPushNotifications();
        Future.delayed(
          const Duration(milliseconds: 4150),
          () {
            paused = true;
            _controller.pause();
            setState(() {});
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    stopwatch.stop();
    stopwatch.reset();
    super.dispose();
  }

  bool load = true;

  Future<List<List<EventModel>>> loadall() async {
    await setupAndInitializeHive();
    var t = await setupProvider();
    return t;
  }

  @override
  Widget build(BuildContext context) {
    if (load == true) {
      load = false;
      data_provider = Provider.of<DataProvider>(context, listen: false);
      data_provider.checkInternetAccess().then((value) {
        loadall().then((days) {
          if (stopwatch.elapsedMilliseconds >= 4250) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(days, data_provider)));
          } else {
            Future.delayed(
              Duration(milliseconds: 4250 - stopwatch.elapsedMilliseconds),
              () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(days, data_provider)));
              },
            );
          }
        });
      });
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          )
        ],
      ),
    );
  }
}
