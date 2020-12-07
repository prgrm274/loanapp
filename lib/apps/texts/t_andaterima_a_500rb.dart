import 'package:flutter/material.dart';

class TAndaTerimaA500rb extends StatefulWidget {
  TAndaTerimaA500rb({Key key}) : super(key: key);

  @override
  _TAndaTerimaA500rbState createState() => _TAndaTerimaA500rbState();
}

class _TAndaTerimaA500rbState extends State<TAndaTerimaA500rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 500.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}