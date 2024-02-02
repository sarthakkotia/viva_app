import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:viva_app/Provider/schedule_provider.dart';
import 'package:viva_app/Widgets/particles_flutter.dart';

import 'Screens/test2_screen.dart';
import 'firebase_options.dart';

//TODO: Add splash screen
//TODO: Configure bottom navigation bar
//TODO: Make bottom navigation bar such that when we scroll down it disappears
//TODO: Notch style would be good with

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  //TODO: implement native splash screen using flutter_native_splash
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScheduleDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: Stack(children: [ParticleBackgroundScreen(), Test2Screen()]),
      ),
    );
  }
}
