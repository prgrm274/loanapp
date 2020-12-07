import 'package:flutter/material.dart';

class ThumbTextOnImage extends StatefulWidget {
  ThumbTextOnImage({Key key}) : super(key: key);

  @override
  _ThumbTextOnImageState createState() =>
      _ThumbTextOnImageState();
}

class _ThumbTextOnImageState extends State<ThumbTextOnImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(
              image: AssetImage('lib/assets/calculator_thumb_bonus.png')
          ),
          Positioned(
            child: Text('6M'),
          )
        ],
      ),
    );
  }
}