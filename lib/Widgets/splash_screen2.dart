import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:viva_app/Screens/Test3Screen.dart';

import '../Models/EventModelwithHive.dart';
import '../Models/EventsList.dart';
import '../Provider/Data_provider.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  late DataProvider data_provider;
  final VideoPlayerController _controller =
      VideoPlayerController.asset('assets/Logos/logorevealvertical.mp4');

  void setupAndInitializeHive() async {
    final dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.initFlutter("hive_db_test");
    Hive.registerAdapter<EventModel>(EventModelAdapter());
    Hive.registerAdapter<EventsList>(EventsListAdapter());
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
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _controller.initialize().then((value) {
      Stopwatch stopwatch = Stopwatch();
      setState(() {});
      _controller.play().then((value) {
        stopwatch.start();
        setupAndInitializeHive();
        setupPushNotifications();
        data_provider = Provider.of<DataProvider>(context, listen: false);
        data_provider.Checkid().then((value) {
          data_provider.fetchFromFirebase(value).then((value) {
            if (stopwatch.elapsedMilliseconds * 1000 >= 5000) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Test3Screen()));
            } else {
              Future.delayed(Duration(
                      milliseconds:
                          5000 - stopwatch.elapsedMilliseconds * 1000))
                  .then((value) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Test3Screen()));
              });
            }
          });
        });
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
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
