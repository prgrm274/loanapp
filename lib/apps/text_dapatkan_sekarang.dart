import 'package:flutter/material.dart';

class TextDapatkanSekarang extends StatefulWidget {
  TextDapatkanSekarang({Key key}) : super(key: key);

  @override
  _TextDapatkanSekarangState createState() => _TextDapatkanSekarangState();
}

class _TextDapatkanSekarangState extends State<TextDapatkanSekarang> {
  @override
  Widget build(BuildContext context) {
    return Text(
        'DAPATKAN DANA SEKARANG!',
        style: TextStyle(
            color: Colors.white,
            fontSize: 13
        )
    );
  }
}