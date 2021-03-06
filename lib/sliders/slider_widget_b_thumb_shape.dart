import 'package:flutter/material.dart';

class SliderWidgetBThumbShape extends SliderComponentShape {
  const SliderWidgetBThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
  });

  final double enabledThumbRadius;
  final double disabledThumbRadius;

  double get _disabledThumbRadiusPrivate =>
      disabledThumbRadius ?? enabledThumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadiusPrivate
    );
  }

  /// OFFSET = POSISI
  @override
  void paint(PaintingContext context, Offset center,
      {
        Animation<double> activationAnimation,
        Animation<double> enableAnimation,
        bool isDiscrete,
        TextPainter labelPainter,
        RenderBox parentBox,
        SliderThemeData sliderTheme,
        TextDirection textDirection,
        double value,
        double textScaleFactor,
        Size sizeWithOverflow
      }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;

    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadiusPrivate,
      end: enabledThumbRadius,
    );

    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    /// TEXT PAINTER
    /// 1 NG X
    // labelPainter.text = 'sfdsafsafaf' as InlineSpan;
    /// 2
    TextSpan span = new TextSpan(style: new TextStyle(color: Colors.grey[600]), text: 'Yrfc');
    // labelPainter.text = span;/// NG X
    /// 3
    // TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    labelPainter = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    labelPainter.layout();
    /// NG NARUH center AS OFFSET
    labelPainter.paint(canvas, center);
    // labelPainter.paint(canvas, new Offset(50.0, 50.0));

    /// FINALLY, CANVAS
    /// V NARUH TEXT DI THUMB DAN NGIKUT THUMB SHAPE
    canvas.drawCircle(
      center,
      radiusTween.evaluate(enableAnimation),
      Paint()..color = colorTween.evaluate(enableAnimation),
    );
  }

/*@override
   void paint(
       PaintingContext context,
       Offset center, {
         Animation<double> activationAnimation,
         @required Animation<double> enableAnimation,
         bool isDiscrete,
         TextPainter labelPainter,
         RenderBox parentBox,
         @required SliderThemeData sliderTheme,
         TextDirection textDirection,
         double value,
       }) {

   }*/
}
