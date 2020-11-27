import 'package:flutter/material.dart';

class TextMasukkanDataDgnBnr extends StatefulWidget {
  String text;

  TextMasukkanDataDgnBnr({Key key, @required String text}) : super(key: key);

  @override
  _TextMasukkanDataDgnBnrState createState() => _TextMasukkanDataDgnBnrState();
}

class _TextMasukkanDataDgnBnrState extends State<TextMasukkanDataDgnBnr> {
  String get text => this.text;

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        alignment: Alignment.topLeft,
        child: Text(
          text,//'Masukkan data dengan benar'
          style: TextStyle(color: Colors.red, fontSize: 12),
        ),
      ),
    ]);
  }
}