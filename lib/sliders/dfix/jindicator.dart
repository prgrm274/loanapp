import 'package:flutter/material.dart';
// import 'package:voidrealm/sliders/dfix/jconst_circle_diameter.dart' as cd;
import 'package:voidrealm/sliders/dfix/jconst_circle_diameter.dart';
import 'package:voidrealm/sliders/dfix/jface.dart';
import 'package:voidrealm/sliders/dfix/jhead.dart';

class MyIndicator extends StatelessWidget {
  MyIndicator({
    this.animationValue,
    width,
    this.onDrag,
    this.onDragStart,
    this.onDragEnd,
  })  : width = width - circleDiameter,
        position = animationValue == 0 ? 0 : animationValue / 4;

  final double position;
  final Function onDrag;
  final Function onDragStart;
  final Function onDragEnd;
  final double width;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        top: 0,
        left: width * position,
        child: _buildIndicator(),
      ),
    );
  }

  _buildIndicator() {
    var opacityOfYellow = position > 0.5 ? 1.0 : position * 2;
    return GestureDetector(
      onPanDown: onDragStart,
      onPanUpdate: onDrag,
      onPanStart: onDrag,
      onPanEnd: onDragEnd,
      child: Container(
        width: circleDiameter,
        height: circleDiameter,
        child: Stack(
          children: <Widget>[
            Head(
              color: Color(0xFFf4b897),
              hasShadow: true,
            ),
            Opacity(
              opacity: opacityOfYellow,
              child: Head(
                color: Color(0xFFfee385),
              ),
            ),
            Face(
              animationValue: animationValue,
            )
          ],
        ),
      ),
    );
  }
}