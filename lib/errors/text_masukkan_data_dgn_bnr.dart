import 'package:flutter/material.dart';

class FalseTextMasukkanDataDgnBnr extends StatefulWidget {

  FalseTextMasukkanDataDgnBnr({Key key}) : super(key: key);

  @override
  _FalseTextMasukkanDataDgnBnrState createState() => _FalseTextMasukkanDataDgnBnrState();
}

class _FalseTextMasukkanDataDgnBnrState extends State<FalseTextMasukkanDataDgnBnr> {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        alignment: Alignment.topLeft,
        child: Text(
          'Masukkan data dengan benar',
          style: TextStyle(color: Colors.red, fontSize: 12, fontFamily: 'Sans'),
        ),
      ),
    ]);
  }
}