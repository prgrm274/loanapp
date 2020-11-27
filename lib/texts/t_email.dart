import 'package:flutter/material.dart';

class Reg050TextEmail extends StatefulWidget {
  Reg050TextEmail({Key key}) : super(key: key);

  @override
  _Reg050TextEmailState createState() => _Reg050TextEmailState();
}

class _Reg050TextEmailState extends State<Reg050TextEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      alignment: Alignment.topLeft,
      child: Text(
        'E-mail',
        style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}