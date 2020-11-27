import 'package:flutter/material.dart';

class Reg050TextNamaLengkap extends StatefulWidget {

  Reg050TextNamaLengkap({Key key}) : super(key: key);

  @override
  _Reg050TextNamaLengkapState createState() => _Reg050TextNamaLengkapState();
}

class _Reg050TextNamaLengkapState extends State<Reg050TextNamaLengkap> {
  @override
  Widget build(BuildContext context) {
    return new Row(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text('Nama lengkap sesuai KTP',
                style: TextStyle(
                    color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'),
              )
          ),
        ]
    );
  }
}