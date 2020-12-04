import 'package:flutter/material.dart';
import 'jconst_circle_diameter.dart';
import 'jpainter.dart';

class Face extends StatelessWidget {
  Face({
    this.color = const Color.fromARGB(150, 150, 0, 150),
    // this.color = const Color(0xFF616154),
    this.animationValue,
  });

  final Color color;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleDiameter,
      width: circleDiameter,
      child: Image(
        image: AssetImage('lib/assets/calculator_thumb_bonus.png'),
        // height: 12,
        // width: 12,
      ),
      // child: CustomPaint(
      //   size: Size(300, 300),
      //   painter: PaintEmoji(animationValue, color: color),
      // ),
    );
  }
}