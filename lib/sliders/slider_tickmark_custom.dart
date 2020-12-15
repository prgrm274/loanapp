import 'package:flutter/material.dart';

/// CUSTOM TICK MARK
/// TITIK-TITIK PUTIH DAN BIRU PADA SLIDER RANGE
///
/// MGKN BISA KUSTOM LGSG DISINI UTK LABEL DI BAWAH TICK
class SliderTickmarkCustom extends SliderTickMarkShape {
  @override
  Size getPreferredSize({SliderThemeData sliderTheme, bool isEnabled}) {
    // TODO: implement getPreferredSize
    throw UnimplementedError();
  }

  @override
  void paint(
      PaintingContext context,
      Offset center,
      {
        RenderBox parentBox,
        SliderThemeData sliderTheme,
        Animation<double> enableAnimation,
        Offset thumbCenter,
        bool isEnabled,
        TextDirection textDirection
      }) {

  }

}