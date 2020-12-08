import 'package:flutter/material.dart';

class TextAndaTerima extends StatefulWidget {
  TextAndaTerima({Key key}) : super(key: key);

  @override
  _TextAndaTerimaState createState() =>
      _TextAndaTerimaState();
}

class _TextAndaTerimaState extends State<TextAndaTerima> {


  @override
  Widget build(BuildContext context) {
    return Text(
      'Anda terima',
      style: TextStyle(
          color: Colors.blue[900],
          fontSize: 13,
          fontFamily: 'Sans'
      ),
    );
  }
}