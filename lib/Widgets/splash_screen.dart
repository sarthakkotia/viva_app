import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:viva_app/Screens/home_page.dart';

import '../Models/EventModelwithHive.dart';
import '../Models/EventsList.dart';
import '../Provider/Data_provider.dart';
import '../Provider/Services/Notifier.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late DataProvider data_provider;
  final VideoPlayerController _controller =
      VideoPlayerController.asset('assets/Logos/logorevealvertical.mp4');

  void setupAndInitializeHive() async {
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

  Future<void> setupProvider() async {
    data_provider = Provider.of<DataProvider>(context, listen: false);
    await data_provider.checkInternetAccess();
    final bool val = await data_provider.Checkid();
    await data_provider.fetchFromFirebase(val);
    data_provider.fetchGenreList();
    data_provider.fetchDaysList();
  }

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((value) {
      _controller.setVolume(0);
      Stopwatch stopwatch = Stopwatch();
      setState(() {});
      _controller.play().then((value) {
        stopwatch.start();
        setupAndInitializeHive();
        setupPushNotifications();
        setupProvider().then((value) {
          var data_provider = Provider.of<DataProvider>(context, listen: false);
          var days = data_provider.days;
          if (stopwatch.elapsedMilliseconds * 1000 >= 4000) {
            stopwatch.stop();
            stopwatch.reset();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(days),
            ));
            stopwatch.stop();
            stopwatch.reset();
          } else {
            stopwatch.stop();
            stopwatch.reset();
            Future.delayed(Duration(
                    milliseconds: 4000 - stopwatch.elapsedMilliseconds * 1000))
                .then((value) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage(days)));
            });
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
