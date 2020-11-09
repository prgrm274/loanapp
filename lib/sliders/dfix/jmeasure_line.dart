import 'package:flutter/material.dart';
import 'package:voidrealm/sliders/dfix/jconst_circle_diameter.dart';
import 'package:voidrealm/sliders/dfix/jface.dart';
import 'package:voidrealm/sliders/dfix/jhead.dart';

/// GARIS SLIDER
/// MeasureLine
class SliderGaris extends StatelessWidget {
  SliderGaris({this.handleTap, this.animationValue, this.states, this.width});

  final double animationValue;
  final Function handleTap;
  final List<String> states;
  final double width;

  List<Widget> _buildUnits() {
    var res = <Widget>[];
    var animatingUnitIndex = animationValue.round();
    var unitAnimatingValue = (animationValue * 10 % 10 / 10 - 0.5).abs() * 2;

    states.asMap().forEach((index, text) {
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
            handleTap(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Transform.scale(
                  scale: scale,
                  child: Stack(
                    children: [
                      Head(),
                      Face(
                        color: Colors.purple[200],
                        // color: Colors.white,
                        animationValue: index.toDouble(),
                      )
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
          width: width - 40,
          child: Container(
            width: width,
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
