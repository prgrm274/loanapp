import 'package:flutter/material.dart';

class TextLabelSliderHari extends StatefulWidget {
  TextLabelSliderHari({Key key, @required this.teks}) : super(key: key);

  String teks;

  @override
  _TextLabelSliderHariState createState() => _TextLabelSliderHariState();
}

class _TextLabelSliderHariState extends State<TextLabelSliderHari> {

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.teks,
      style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontFamily: 'Sans'
      ),
    );
  }
}