import 'package:flutter/material.dart';

class JCustomTriangle extends StatefulWidget {
  JCustomTriangle({Key key}) : super(key: key);

  @override
  _JCustomTriangleState createState() => _JCustomTriangleState();
}

class _JCustomTriangleState extends State<JCustomTriangle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      // child: Container(),
      child: CustomPaint(
          child: Text('text'),
          painter: JCustomTrianglePainter(),
      ),
    );
  }
}

class JCustomTrianglePainter extends CustomPainter {
  Paint painter;

  JCustomTrianglePainter() {

    painter = Paint()
      ..color = Colors.white60
      ..style = PaintingStyle.fill;

  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width/2, size.height/2);
    path.lineTo(size.width/2, size.height/4);
    path.lineTo(size.height/12, size.width/3);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
