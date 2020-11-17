import 'package:flutter/material.dart';

class TextTempatLahir extends StatefulWidget {

  TextTempatLahir({Key key}) : super(key: key);

  @override
  _TextTempatLahirState createState() => _TextTempatLahirState();
}

class _TextTempatLahirState extends State<TextTempatLahir> {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        alignment: Alignment.topLeft,
        child: Text('Tempat lahir',
          style: TextStyle(color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'),
        )),
    ]);
  }
}