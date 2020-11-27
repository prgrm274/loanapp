import 'package:flutter/material.dart';

class Reg050TextTglLahir extends StatefulWidget {
  Reg050TextTglLahir({Key key}) : super(key: key);

  @override
  _Reg050TextTglLahirState createState() => _Reg050TextTglLahirState();
}

class _Reg050TextTglLahirState extends State<Reg050TextTglLahir> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      alignment: Alignment.topLeft,
      child: Text(
          'Tanggal lahir',
          style: TextStyle(
              color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans')),
    );
  }
}
