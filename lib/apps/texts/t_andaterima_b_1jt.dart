import 'package:flutter/material.dart';

class TAndaTerimaB1jt extends StatefulWidget {
  TAndaTerimaB1jt({Key key}) : super(key: key);

  @override
  _TAndaTerimaB1jtState createState() => _TAndaTerimaB1jtState();
}

class _TAndaTerimaB1jtState extends State<TAndaTerimaB1jt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 1.000.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}