import 'package:flutter/material.dart';
// import 'jconst_circle_diameter.dart' as cd;
import 'jconst_circle_diameter.dart';
import 'jface.dart';
import 'slider7_head.dart';

class MyIndicator extends StatelessWidget {
  MyIndicator({
    this.animationValue,
    width,
    this.onDrag,
    this.onDragStart,
    this.onDragEnd,
  }) : width = width - circleDiameter,
        position = animationValue == 0 ? 0 : animationValue / 4;

  /// POSITION IS COORDINATE OF WHEN YOU MOVE THE SLIDER THUMB
  final double animationValue, position, width;
  final Function onDrag, onDragStart, onDragEnd;

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
            /// index 0
            Head(
              /// misal ijo, maka ke kiri akan semakin menghijau
              /// misal merah, maka ke kiri akan semakin memerah
              color: Color.fromARGB(200, 240, 120, 123),
              // color: Color(0xFFf4b897),
              hasShadow: true,
            ),

            /// index 1, dst
            /// WARNA UNTUK KE KANAN, OPASITAS INI SEAKAN AKAN PENYEIMBANGNYA
            /// MISAL OPASITAS KUNING MAKA DARI HEAD MERAH DIGESER KE KANAN AKAN SEMAKIN MENGUNING
            Opacity(
              opacity: opacityOfYellow,
              child: Head(
                color: Color.fromARGB(150, 180, 250, 25),
                // color: Color(0xFFfee385),
              ),
            ),

            // position == 2 ? Face(
            //   animationValue: animationValue,
            // ) :
            // null,/// a Stack's children mustn't contain any null values, but a null value was found at index 2
            // false,/// b type 'bool' is not a subtype of type 'Widget'
            // (){/// c type '()=>Null' is not a subtype of type 'Widget'
            //   print('Position is not 2');
            // },

            Face(animationValue: animationValue,),

            /// NG
            /// POSITION IS COORDINATE OF WHEN YOU MOVE THE SLIDER THUMB
            /// SO 500K = 0.0
            /// 1M = 0.25
            /// 1.5M = 0.5
            /// 2M = 0.75
            /// 3M = 1.0
            /// WHEN YOU ARE BETWEEN TWO VALUES THE COORDINATE WILL BE LIKE 0.0 .. 0.25 LIKE 0.12345678..
            Text(position.toString()),
          ],
        ),
      ),
    );
  }
}