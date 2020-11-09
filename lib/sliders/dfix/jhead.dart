import 'package:flutter/material.dart';
import 'package:voidrealm/sliders/dfix/jconst_circle_diameter.dart';

/// ICON ATAU SHAPE YANG POSISINYA DI TITIK-TITIK SLIDER
class Head extends StatelessWidget {
  Head({
    this.color = const Color.fromARGB(200, 100, 50, 75),
    // this.color = const Color(0xFFc9ced2),
    this.hasShadow = false
  });

  final Color color;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleDiameter,
      width: circleDiameter,
      decoration: BoxDecoration(
        boxShadow: hasShadow ?
        [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 5.0
              // blurRadius: 5.0
          )
        ] :
        null,
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}