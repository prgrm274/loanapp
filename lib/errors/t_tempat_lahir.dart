import 'package:flutter/material.dart';

class Reg050TextTempatLahir extends StatefulWidget {

  Reg050TextTempatLahir({Key key}) : super(key: key);

  @override
  _Reg050TextTempatLahirState createState() => _Reg050TextTempatLahirState();
}

class _Reg050TextTempatLahirState extends State<Reg050TextTempatLahir> {
  @override
  Widget build(BuildContext context) {
    return new Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            alignment: Alignment.topLeft,
            child: Text('Tempat lahir',
              style: TextStyle(
                  color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'),
            )
          ),
        ]
    );
  }
}