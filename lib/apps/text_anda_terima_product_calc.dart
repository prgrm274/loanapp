import 'package:flutter/material.dart';

class TextAndaTerimaProductCalc extends StatefulWidget {
  TextAndaTerimaProductCalc({Key key}) : super(key: key);

  @override
  _TextAndaTerimaProductCalcState createState() =>
      _TextAndaTerimaProductCalcState();
}

class _TextAndaTerimaProductCalcState extends State<TextAndaTerimaProductCalc> {
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.blue[900],
          fontSize: 12,
          fontFamily: 'Sans'
      ),
    );
  }
}