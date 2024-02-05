import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:viva_app/Screens/Test3Screen.dart';
import 'package:viva_app/Screens/test2_screen.dart';

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

  @override
  void initState() {
    super.initState();
    _controller.initialize();
    Stopwatch stopwatch = Stopwatch();
    setState(() {});
    _controller.play();
    stopwatch.start();
    data_provider = Provider.of<DataProvider>(context, listen: false);
    data_provider.Checkid().then((value) {
      data_provider.fetchFromFirebase(value).then((value) {
        if(stopwatch.elapsedMilliseconds*1000>=5000) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Test3Screen()));
        }else{
          Future.delayed(Duration(milliseconds: 5000-stopwatch.elapsedMilliseconds*1000)).then((value) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Test3Screen()));
          });
        }
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
