import 'package:flutter/material.dart';

class CustomTriangle extends StatefulWidget {
  CustomTriangle({Key key}) : super(key: key);

  @override
  _CustomTriangleState createState() => _CustomTriangleState();
}

class _CustomTriangleState extends State<CustomTriangle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(painter: CustomTrianglePainter()),
    );
  }
}

class CustomTrianglePainter extends CustomPainter {
  Paint painter;

  CustomTrianglePainter() {

    painter = Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill;

  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
