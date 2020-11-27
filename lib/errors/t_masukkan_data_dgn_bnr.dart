import 'package:flutter/material.dart';

class ErrorTextMasukkanDataDgnBnr extends StatefulWidget {

  ErrorTextMasukkanDataDgnBnr({Key key}) : super(key: key);

  @override
  _ErrorTextMasukkanDataDgnBnrState createState() => _ErrorTextMasukkanDataDgnBnrState();
}

class _ErrorTextMasukkanDataDgnBnrState extends State<ErrorTextMasukkanDataDgnBnr> {
  @override
  Widget build(BuildContext context) {
    return new Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            alignment: Alignment.topLeft,
            child: Text(
              'Masukkan data dengan benar',
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontFamily: 'Sans'),
            ),
          ),
        ]
    );
  }
}