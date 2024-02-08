import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationClass {
  Future<void> intitalize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'users', 'users',
        description: 'This channel is used for important notifications.',
        importance: Importance.high,
        showBadge: true,
        enableVibration: true,
        playSound: true);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var android = const AndroidNotificationDetails(
      'users',
      'users',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    var platform = NotificationDetails(android: android);
    FirebaseMessaging.onMessage.listen((event) {
      flutterLocalNotificationsPlugin.show(
          1, event.notification!.title, event.notification!.body, platform);
    });
  }
}
