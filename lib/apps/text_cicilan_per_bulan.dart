import 'package:flutter/material.dart';

class TextCicilanPerBulan extends StatefulWidget {
  TextCicilanPerBulan({Key key}) : super(key: key);

  @override
  _TextCicilanPerBulanState createState() => _TextCicilanPerBulanState();
}

class _TextCicilanPerBulanState extends State<TextCicilanPerBulan> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Cicilan per bulan',
      style: TextStyle(
          color: Colors.blue[900],
          fontSize: 13,
          fontFamily: 'Sans'
      ),
    );
  }
}