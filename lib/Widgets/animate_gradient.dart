import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

class AnimateGradientClass extends StatelessWidget {
  final Widget child;
  const AnimateGradientClass(this.child);

  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.white,
          Colors.blueAccent,
          Colors.blue,
        ],
        child: child,
      ),
    );
  }
}
