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
          image: AssetImage("assets/Logos/middlelayer.jpg"),
          preventCrop: true,
          imageBlurValue: 5,
        ),
        Layer(
          sensitivity: 7,
          image: AssetImage("assets/Logos/obj.png"),
          imageHeight: 500,
          imageFit: BoxFit.fitHeight,
        ),
        Layer(
          sensitivity: 12,
          child: Text('Topmost layer'),
        ),
      ],
      child: Column(
        children: [
          // ListView.builder(
          //   itemCount: 2,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text("Sd"),
          //     );
          //   },
          //   scrollDirection: Axis.horizontal,
          // ),
          // StackedListView(
          //   itemCount: 2,
          //   builder: (context, index) {
          //     return Card(
          //       child: Text("aff"),
          //     );
          //   },
          //   itemExtent: 20,
          // ),
        ],
      ),
    );
  }
}
