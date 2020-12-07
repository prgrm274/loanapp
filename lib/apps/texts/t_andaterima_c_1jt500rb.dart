import 'package:flutter/material.dart';

class TAndaTerimaC1jt500rb extends StatefulWidget {
  TAndaTerimaC1jt500rb({Key key}) : super(key: key);

  @override
  _TAndaTerimaC1jt500rbState createState() => _TAndaTerimaC1jt500rbState();
}

class _TAndaTerimaC1jt500rbState extends State<TAndaTerimaC1jt500rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 1.500.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}