import 'package:flutter/material.dart';

class TextTableRow extends StatefulWidget {
  TextTableRow({Key key, @required this.teks}) : super(key: key);

  String teks;

  @override
  _TextTableRowState createState() => _TextTableRowState();
}

class _TextTableRowState extends State<TextTableRow> {

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.teks,
      style: TextStyle(
          color: Colors.blue[900],
          fontSize: 13,
          fontFamily: 'Sans'
      ),
    );
  }
}