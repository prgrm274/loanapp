import 'package:flutter/material.dart';
import 'package:voidrealm/sliders/dfix/jconst_circle_diameter.dart';
import 'package:voidrealm/sliders/dfix/jface.dart';
import 'package:voidrealm/sliders/dfix/slider7_head.dart';

/// GARIS SLIDER
/// MeasureLine
class SliderGaris extends StatelessWidget {
  SliderGaris({this.handleTapnya, this.nilaiAnimasi, this.statesnya, this.lebar});

  final double nilaiAnimasi;
  final Function handleTapnya;
  final List<String> statesnya;
  final double lebar;

  List<Widget> _buildUnits() {
    var res = <Widget>[];
    var animatingUnitIndex = nilaiAnimasi.round();
    var unitAnimatingValue = (nilaiAnimasi * 10 % 10 / 10 - 0.5).abs() * 2;

    statesnya.asMap().forEach((index, text) {
      var paddingTop = 0.0;
      var scale = 0.7;
      var opacity = .3;
      if (animatingUnitIndex == index) {
        paddingTop = unitAnimatingValue * 5;
        scale = (1 - unitAnimatingValue) * 0.7;
        opacity = 0.3 + unitAnimatingValue * 0.7;
      }
      res.add(LimitedBox(
        key: ValueKey(text),
        maxWidth: circleDiameter,
        child: GestureDetector(
          onTap: () {
            handleTapnya(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Transform.scale(
                  scale: scale,
                  child: Stack(
                    children: [
                      // Head(),

                      // Face(
                      //     color: Colors.purple[200],
                      //     // color: Colors.white,
                      //     animationValue: index.toDouble()
                      // ),

                      /// BUAT CIRCLE PUTIH (DAN BIRU UNTUK 3M,6M,10M)
                      Container(
                        /// LEBAR DAN PANJANG POINT
                        width: 25,//20 teks ga cukup, misal 1M jadinya 1 dibawah M
                        height: 65,
                        decoration: new BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),

                        /// NG ADD
                        child: Text(text),/// 0 1 2 3 4
                        // child: Text(index.toString()),/// 0 1 2 3 4
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: paddingTop),
                child: Opacity(
                  opacity: opacity,
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: circleDiameter / 2,
          left: 20,
          width: lebar - 40,
          child: Container(
            width: lebar,
            color: Colors.blue[100],
            // color: Color(0xFFeceeef),
            height: 6,
            // height: 3,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildUnits(),
        ),
      ],
    );
  }
}
