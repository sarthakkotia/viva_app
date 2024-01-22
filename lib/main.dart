import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/home_page.dart';

//TODO: Add splash screen
//TODO: Configure bottom navigation bar
//TODO: Make bottom navigation bar such that when we scroll down it disappears
//TODO: Notch style would be good with

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  //TODO: implement native splash screen using flutter_native_splash
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
