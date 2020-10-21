import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voidrealm/gradients/gradient1.dart';

class Image1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.green
            ),
            /*image: DecorationImage(
              image: AssetImage(
                  'lib/assets/image.jpg'),
              fit: BoxFit.fill,
            ),*/
            shape: BoxShape.circle,
          ),
        ),
        height: 400.0,
        width: 400.0,
        decoration: BoxDecoration(
          gradient: SweepGradient(
              colors: [
                Colors.pink,
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.teal
              ],
              // stops: [0.74, 0.5, 0.4],
              stops: [0.8, 0.96, 0.74, 0.22, 0.85],
              startAngle: 0.5,
              // startAngle: 0.5,
              endAngle: 1
              // endAngle: 1
          ),
        )
      ),

    );
  }
}