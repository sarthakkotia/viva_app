import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:viva_app/Screens/test2_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final VideoPlayerController _controller =
      VideoPlayerController.asset('assets/Logos/logorevealvertical.mp4');

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
    setupPushNotifications();
    _controller.initialize().then((value) {
      setState(() {});
      _controller.play().then((value) {
        Future.delayed(const Duration(seconds: 5), () {
          // Navigate to Test2Screen after 5 seconds
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Test2Screen(),
            ),
          );
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
