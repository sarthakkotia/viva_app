import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class ParticleBackgroundScreen extends StatelessWidget {
  final Widget child;
  ParticleBackgroundScreen(this.child);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            CircularParticle(
              awayRadius: 80,
              numberOfParticles: 200,
              speedOfParticles: 1,
              height: screenHeight,
              width: screenWidth,
              onTapAnimation: true,
              particleColor: Colors.white.withAlpha(150),
              awayAnimationDuration: Duration(milliseconds: 600),
              maxParticleSize: 8,
              isRandSize: true,
              isRandomColor: true,
              randColorList: [
                Colors.red.withAlpha(210),
                Colors.white.withAlpha(210),
                Colors.yellow.withAlpha(210),
                Colors.green.withAlpha(210)
              ],
              awayAnimationCurve: Curves.easeInOutBack,
              enableHover: true,
              hoverColor: Colors.white,
              hoverRadius: 90,
              connectDots: true,
            ),
            Center(
              child: child,
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset:
          false, // Ensures that the keyboard doesn't overlap the background
    );
  }
}
