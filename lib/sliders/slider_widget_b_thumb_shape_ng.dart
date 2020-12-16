import 'package:flutter/material.dart';

/// SliderWidgetBThumbShapeNg
/// ng = nambahin variabel valueTextSpan untuk valuenya slider nanti
class SliderWidgetBThumbShapeNg extends SliderComponentShape {
  const SliderWidgetBThumbShapeNg({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
    this.valueTextSpan
  });

  final TextSpan valueTextSpan;
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

    /// TARUH OFFSET DI CANVAS
    /// V NARUH TEXT DI THUMB DAN NGIKUT THUMB SHAPE
    canvas.drawCircle(
      center,
      radiusTween.evaluate(enableAnimation),
      Paint()..color = colorTween.evaluate(enableAnimation),
    );

    /// TEXT PAINTER
    ///

    /// 1 NG X
    // labelPainter.text = 'sfdsafsafaf' as InlineSpan;

    /// 2 COBA TEXTSPAN ASAL
    TextSpan span = new TextSpan(
        style: new TextStyle(
            color: Colors.grey[600]
        ),
        text: 'Coba textspan'
    );
    // labelPainter.text = span;/// NG X

    /// 3
    // TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    labelPainter = new TextPainter(
      text: valueTextSpan,/// v
      // text: span,/// v
      textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
    );
    labelPainter.layout();

    /// TARUH TEXTPAINTER DI CANVAS

    /// NG NARUH center AS OFFSET
    /// NG TULIS SETELAH canvas.drawCircle JADI BIAR DIATAS CIRCLE TEXTNYA
    // labelPainter.paint(canvas, center);/// v
    // labelPainter.paint(canvas, new Offset(50.0, 50.0));
    /// NG v SET NEW OFFSET
    // center = new Offset(0, 0);
    labelPainter.paint(
        canvas,
        // center
        // center - (Offset(12, 8))
        valueTextSpan.text.length > 2 ?
        center - (Offset(12, 8)) :
        center - (Offset(10, 8))
    );/// ng v center-(Offset(10, 10)) if font size is 14 (default fontSize)
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