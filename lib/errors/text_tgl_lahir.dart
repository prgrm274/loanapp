import 'package:flutter/material.dart';

class TextTglLahir extends StatefulWidget {

  TextTglLahir({Key key}) : super(key: key);

  @override
  _TextTglLahirState createState() => _TextTglLahirState();
}

class _TextTglLahirState extends State<TextTglLahir> {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        alignment: Alignment.topLeft,
        child: Text('Tanggal lahir',
            style: TextStyle(color: Colors.grey[400], fontSize: 12,
                fontFamily: 'Sans')),
      )]);
  }
}