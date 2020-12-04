import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as v_math;

class PaintEmoji extends CustomPainter {
  PaintEmoji(
      animationValue, {
        this.color = const Color(0xFF615f56),
      })  : activeIndex = animationValue.floor(),
        unitAnimatingValue = (animationValue * 10 % 10 / 10);

  Color color;
  final int activeIndex;
  final double unitAnimatingValue;

  @override
  void paint(Canvas canvas, Size size) {
    _drawEye(canvas, size);
    _drawMouth(canvas, size);
  }

  _drawEye(canvas, size) {
    var angle = 0.0;
    var wide = 0.0;

    switch (activeIndex) {
      case 0:
        angle = 55 - unitAnimatingValue * 50;
        wide = 80.0;
        break;
      case 1:
        wide = 80 - unitAnimatingValue * 80;
        angle = 5;
        break;
    }
    var degree1 = 90 * 3 + angle;
    var degree2 = 90 * 3 - angle + wide;
    var x1 = size.width / 2 * 0.65;
    var x2 = size.width - x1;
    var y = size.height * 0.41;
    var eyeRadius = 5.0;

    var paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(x1, y),
        radius: eyeRadius,
      ),
      v_math.radians(degree1),
      v_math.radians(360 - wide),
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(x2, y),
        radius: eyeRadius,
      ),
      v_math.radians(degree2),
      v_math.radians(360 - wide),
      false,
      paint,
    );
  }

  _drawMouth(Canvas canvas, size) {
    var upperY = size.height * 0.70;
    var lowerY = size.height * 0.77;
    var middleY = (lowerY - upperY) / 2 + upperY;

    var leftX = size.width / 2 * 0.65;
    var rightX = size.width - leftX;
    var middleX = size.width / 2;

    double y1, y3, x2, y2;
    Path path2;
    switch (activeIndex) {
      case 0:
        y1 = lowerY;
        x2 = middleX;
        y2 = upperY;
        y3 = lowerY;
        break;
      case 1:
        y1 = lowerY;
        x2 = middleX;
        y2 = unitAnimatingValue * (middleY - upperY) + upperY;
        y3 = lowerY - unitAnimatingValue * (lowerY - upperY);
        break;
      case 2:
        y1 = unitAnimatingValue * (upperY - lowerY) + lowerY;
        x2 = middleX;
        y2 = unitAnimatingValue * (lowerY + 3 - middleY) + middleY;
        y3 = upperY;
        break;
      case 3:
        y1 = upperY;
        x2 = middleX;
        y2 = lowerY + 3;
        y3 = upperY;
        path2 = Path()
          ..moveTo(leftX, y1)
          ..quadraticBezierTo(
            x2,
            y2,
            upperY - 2.5,
            y3 - 2.5,
          )
          ..quadraticBezierTo(
            x2,
            y2 - unitAnimatingValue * (y2 - upperY + 2.5),
            leftX,
            upperY - 2.5,
          )
          ..close();
        break;
      case 4:
        y1 = upperY;
        x2 = middleX;
        y2 = lowerY + 3;
        y3 = upperY;
        path2 = Path()
          ..moveTo(leftX, y1)
          ..quadraticBezierTo(
            x2,
            y2,
            upperY - 2.5,
            y3 - 2.5,
          )
          ..quadraticBezierTo(
            x2,
            upperY - 2.5,
            leftX,
            upperY - 2.5,
          )
          ..close();
        break;
    }
    var path = Path()
      ..moveTo(leftX, y1)
      ..quadraticBezierTo(
        x2,
        y2,
        rightX,
        y3,
      );

    canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 5);

    if (path2 != null) {
      canvas.drawPath(
        path2,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(PaintEmoji oldDelegate) {
    return unitAnimatingValue != oldDelegate.unitAnimatingValue ||
        activeIndex != oldDelegate.activeIndex;
  }
}