import 'package:flutter/material.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Parallax(
      layers: [
        Layer(
          sensitivity: 1,
          image: const AssetImage("assets/Logos/subwaysurferbg.webp"),
          imageBlurValue: 2,
        ),
        Layer(
          sensitivity: 12,
          image: const AssetImage("assets/Logos/subwaysurf.png"),
          imageHeight: 500,
          imageFit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
