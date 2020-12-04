import 'package:flutter/material.dart';

class SliderCurrentCustomCircle extends SliderComponentShape {
  final double thumbRadius, min, max;

  const SliderCurrentCustomCircle({
    @required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        Animation<double> activationAnimation,
        Animation<double> enableAnimation,
        bool isDiscrete,
        TextPainter labelPainter,
        RenderBox parentBox,
        SliderThemeData sliderTheme,
        TextDirection textDirection,
        double value,
        double textScaleFactor,
        Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    /// TEXT ON THUMB
    TextSpan span = new TextSpan(
      style: new TextStyle(
        color: Colors.blue[900],
        // color: sliderTheme.thumbColor,
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w500,
      ),
      text: getValue(value) + "M",
    );
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
    );
    tp.layout();

    Offset textCenter =
    Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);

    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min+(max-min)*value).round().toString();
  }
}