import 'package:flutter/material.dart';

class TextNamaLengkap extends StatefulWidget {

  TextNamaLengkap({Key key}) : super(key: key);

  @override
  _TextNamaLengkapState createState() => _TextNamaLengkapState();
}

class _TextNamaLengkapState extends State<TextNamaLengkap> {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        alignment: Alignment.topLeft,
        child: Text(
          'Nama lengkap sesuai KTP',
          style: TextStyle(color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'),
        ),
      ),
    ]);
  }
}