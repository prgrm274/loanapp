import 'package:flutter/material.dart';

class TAndaTerimaD2jt extends StatefulWidget {
  TAndaTerimaD2jt({Key key}) : super(key: key);

  @override
  _TAndaTerimaD2jtState createState() => _TAndaTerimaD2jtState();
}

class _TAndaTerimaD2jtState extends State<TAndaTerimaD2jt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 2.000.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}